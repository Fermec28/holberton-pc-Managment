# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'data_serials.csv'))
serials_csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
serials_csv.each do |row|
  t = Computer.new
  t.serial = row['serial_number']
  t.type = row['type']
  t.save
  puts "#{t.serial} saved"
  end

  puts "There are now #{Computer.count} rows in the transactions table"