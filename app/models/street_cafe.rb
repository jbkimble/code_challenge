class StreetCafe < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :postcode, presence: true
  validates :chairs_num, presence: true

  def self.unique_postcodes
    find_by_sql("SELECT DISTINCT postcode FROM street_cafes;")
  end

  def total_places
    StreetCafe.count_by_sql("SELECT COUNT(id) FROM street_cafes
                             WHERE postcode = '#{self.postcode}';")
  end

  def total_chairs
    StreetCafe.count_by_sql("SELECT SUM(chairs_num) FROM street_cafes
                             WHERE postcode = '#{self.postcode}';")
  end

  def percentage_of_all_chairs_at_postcode
    # Beloq code returns '0' something to do with both individual queries returning integers instead of floats
    percentage = StreetCafe.count_by_sql("SELECT SUM(chairs_num) FROM street_cafes
                                          WHERE postcode = '#{self.postcode}';").to_f /
                 StreetCafe.count_by_sql("SELECT SUM(chairs_num) FROM street_cafes;").to_f

    (percentage * 100.0).round(2)
  end

  def cafe_with_max_chairs
    StreetCafe.find_by_sql("SELECT name FROM street_cafes
                            WHERE postcode = '#{self.postcode}'
                            ORDER BY chairs_num DESC LIMIT 1;").first.name
  end

  def max_chairs
    StreetCafe.find_by_sql("SELECT chairs_num FROM street_cafes
                            WHERE postcode = '#{self.postcode}'
                            ORDER BY chairs_num DESC LIMIT 1;").first.chairs_num
  end

end
