class StreetCafe < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :postcode, presence: true
  validates :chairs_num, presence: true

  def self.unique_postcodes
    find_by_sql("SELECT DISTINCT postcode FROM street_cafes")
  end

  def total_places
    StreetCafe.count_by_sql("SELECT COUNT(id) FROM street_cafes
                             WHERE postcode = '#{self.postcode}'")
  end
end
