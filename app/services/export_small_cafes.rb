class ExportSmallCafes
  
  def small_cafes
    StreetCafe.find_by_sql("SELECT * FROM street_cafes
                            WHERE category LIKE '%small'")
  end

  def export_cafes
    CSV.open("./lib/small_street_cafes.csv", "w+") do |csv|
      csv << StreetCafe.attribute_names
      small_cafes.each do |cafe|
        csv << cafe.attributes.values
        cafe.destroy
      end
    end
  end

end
