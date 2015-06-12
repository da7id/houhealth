# full-data.csv presents each violation as a separate row. It makes more sense to model the restaurants and their violations separately with a has-many/belongs-to relationship.  This rake task generates the restaurant model from the dataset.

require 'csv'

task :generate_restaurant_entries => :environment do

  csv_text = File.read('db/data/inspections-by-site-fiscale-year-151.csv')
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    account_number = row[0]
    if !(Restaurant.exists? account_number: account_number)
      Restaurant.create(account_number: row[0],
                        facility_name: row[1],
                        facility_type: row[3],
                        address: row[7],
                        number_of_employees: row[14])
    end
  end

end
