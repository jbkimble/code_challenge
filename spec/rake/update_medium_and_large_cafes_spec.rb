require 'rails_helper'

describe 'rake update_medium_and_large_cafe_names' do
  scenario 'It updates records' do
    StreetCafe.create(name: "Margeries Cafe", address:"123 LeMond Drive", postcode: "LS1 FBN", chairs_num: 99, category: "ls1 medium")
    StreetCafe.create(name: "MargCafe", address:"123 LeMond Drive", postcode: "LS1 FNN", chairs_num: 13, category: "ls1 large")

    UpdateMediumAndLargeCafes.new.update_cafes

    expect(StreetCafe.first.name).to eq("ls1 medium Margeries Cafe")
    expect(StreetCafe.second.name).to eq("ls1 large MargCafe")
  end

  scenario 'It does not update small or other cafes' do
    StreetCafe.create(name: "Margeries Cafe", address:"123 LeMond Drive", postcode: "LS1 FBN", chairs_num: 99, category: "ls1 small")
    StreetCafe.create(name: "MargCafe", address:"123 LeMond Drive", postcode: "LS1 FNN", chairs_num: 13, category: "other")

    UpdateMediumAndLargeCafes.new.update_cafes

    expect(StreetCafe.first.name).to eq("Margeries Cafe")
    expect(StreetCafe.second.name).to eq("MargCafe")
  end

end
