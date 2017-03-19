class UpdateMediumAndLargeCafes

  def medium_and_large_cafes
    StreetCafe.find_by_sql("SELECT * FROM street_cafes
                            WHERE category LIKE '%medium'
                            OR category LIKE '%large'")
  end


  def update_cafes
    medium_and_large_cafes.each do |cafe|
      cafe.name.prepend(cafe.category + " ")
      cafe.save
    end
  end

end
