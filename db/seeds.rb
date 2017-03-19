# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

class SeedStreetCafes
require 'csv'

  def self.import_csv(file_path)
    CSV.foreach(file_path, :headers => true) do |row|
      row = row.to_hash
      cleaned_row = row.delete_if { |key, value| key.nil? }
      StreetCafe.create!(cleaned_row)
    end
  end
end

SeedStreetCafes.import_csv('./lib/seeds/Street_Cafes_2015_16.csv')
