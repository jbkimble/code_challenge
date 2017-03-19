desc "For medium and large cafe: concatenates category name to begining of cafe name"

task update_medium_and_large_cafe_names: :environment do

  UpdateMediumAndLargeCafes.new.update_cafes

end
