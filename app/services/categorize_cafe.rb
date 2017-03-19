class CategorizeCafe

  def initialize(cafe)
    give_category_value(cafe)
  end

  def give_category_value(cafe)
    if  cafe.postcode[0..2] == "LS1"
      cafe.category = 'ls1 small' if cafe.chairs_num < 10
      cafe.category = 'ls1 medium' if cafe.chairs_num >= 10 && cafe.chairs_num < 100
      cafe.category = 'ls1 large' if cafe.chairs_num >= 100
    elsif cafe.postcode[0..2] == "LS2"
      cafe.category = 'ls2 small' if cafe.chairs_num < median_cafe
      cafe.category = 'ls2 large' if cafe.chairs_num >= median_cafe
    else
      cafe.category = 'other'
    end
    cafe.save
  end

  def median_cafe
    ls2_cafes = ordered_ls2_cafes
    top_half_of_cafes = ls2_cafes[0..(ls2_cafes.length/2 - 1)]
    ordered_cafes = top_half_of_cafes.map(&:chairs_num)
    ordered_cafes[-1]
  end

  def ordered_ls2_cafes
    StreetCafe.find_by_sql("SELECT chairs_num FROM street_cafes
                            WHERE postcode LIKE 'LS2%'
                            ORDER BY chairs_num DESC")
  end

end
