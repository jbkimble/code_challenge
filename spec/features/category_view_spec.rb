require 'rails_helper'

describe "When I visit '/category'" do
  scenario 'I see a table with the correct headers' do
    visit '/category'

    expect(page).to have_content("Category Information Table")

    within('tr') do |ref|
      expect(page).to have_content("Category")
      expect(page).to have_content("total_places")
      expect(page).to have_content("total_chairs")
    end
  end

  scenario "I see all categories in the 'Category' column" do
    StreetCafe.create(name: "Lennys Cafe", address:"123 Castle Drive", postcode: "LS1 FBN", chairs_num: 20, category: "other")
    StreetCafe.create(name: "Margeries Cafe", address:"123 LeMond Drive", postcode: "LS1 FBN", chairs_num: 30, category: "ls1 large")
    StreetCafe.create(name: "Tammy's Egg Nest", address:"123 LeMond Drive", postcode: "LS2 TRH", chairs_num: 30, category: "ls2 small")

    visit '/category'

    expect(page).to have_content("other")
    expect(page).to have_content("ls1 large")
    expect(page).to have_content("ls2 small")
  end

  scenario "I see the number of cafes in each category" do
    StreetCafe.create(name: "Margeries Cafe", address:"123 LeMond Drive", postcode: "LS1 FBN", chairs_num: 30, category: "ls1 large")
    StreetCafe.create(name: "Mags Cafe", address:"1 LeMond Drive", postcode: "LS1 FBN", chairs_num: 15, category: "ls1 large")
    StreetCafe.create(name: "Toms Cafe", address:"123 LeM Drive", postcode: "LS1 FBN", chairs_num: 20, category: "ls1 large")
    StreetCafe.create(name: "Larry Cafe", address:"12 LeMond Drive", postcode: "LS1 FBN", chairs_num: 15, category: "other")
    StreetCafe.create(name: "Meg Cafe", address:"123 LeMond Dr", postcode: "LS1 FBN", chairs_num: 20, category: "other")

    visit '/category'

    expect(page).to have_content("3")
    expect(page).to have_content("2")
  end

  scenario "I see the total chairs for each category" do
    StreetCafe.create(name: "Margeries Cafe", address:"123 LeMond Drive", postcode: "LS1 FBN", chairs_num: 30, category: "ls1 large")
    StreetCafe.create(name: "Mags Cafe", address:"123 Le Drive", postcode: "LS1 FBN", chairs_num: 15, category: "ls1 large")
    StreetCafe.create(name: "Tom Cafe", address:"123 LeMo Drive", postcode: "LS1 FBN", chairs_num: 20, category: "ls1 large")
    StreetCafe.create(name: "Frank Cafe", address:"12 LeMond Drive", postcode: "LS1 FBN", chairs_num: 11, category: "other")
    StreetCafe.create(name: "Lindas Cafe", address:"13 LeMond Drive", postcode: "LS1 FBN", chairs_num: 10, category: "other")

    visit '/category'

    expect(page).to have_content("65")
    expect(page).to have_content("21")
  end
end
