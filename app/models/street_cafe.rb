class StreetCafe < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :postcode, presence: true
  validates :chairs_num, presence: true

  def self.unique_postcodes
    find_by_sql("SELECT DISTINCT postcode FROM street_cafes")
  end
end
