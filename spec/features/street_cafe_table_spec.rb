require 'rails_helper'

describe "As a visitor to '/cafes'" do

  scenario "It shows me a table with all the correct headers" do
    visit '/cafes'

    expect(page).to have_content("Street Cafes By Post Code")
    expect(page).to have_content("post_code")
    expect(page).to have_content("total_places")
    expect(page).to have_content("total_chairs")
    expect(page).to have_content("chairs_pct")
    expect(page).to have_content("place_with_max_chairs")
    expect(page).to have_content("max_chairs")
  end

  scenario "It displays unique post codes" do
    StreetCafe.create(name: "Lennys Cafe", address:"123 Castle Drive", postcode: "LS1 FBN", chairs_num: 20)
    StreetCafe.create(name: "Margeries Cafe", address:"123 LeMond Drive", postcode: "LS1 FBN", chairs_num: 30)
    StreetCafe.create(name: "Tammy's Egg Nest", address:"123 LeMond Drive", postcode: "LS2 TRH", chairs_num: 30)

    visit '/cafes'

    expect(page).to have_content("LS1 FBN")
    expect(page).to have_content("LS2 TRH")
  end

  scenario "It displays the number of places at each post code" do
    StreetCafe.create(name: "Lennys Cafe", address:"123 Castle Drive", postcode: "LS1 FBN", chairs_num: 20)
    StreetCafe.create(name: "Margeries Cafe", address:"123 LeMond Drive", postcode: "LS1 FBN", chairs_num: 30)
    StreetCafe.create(name: "Pauls Cafe", address:"123 Bandolier Drive", postcode: "LS1 FBN", chairs_num: 30)
    StreetCafe.create(name: "Tammy's Egg Nest", address:"123 Orange Drive", postcode: "LS2 TRH", chairs_num: 30)
    StreetCafe.create(name: "Mary's Egg Nest", address:"123 Banana Park", postcode: "LS2 TRH", chairs_num: 30)

    visit '/cafes'
    expect(page).to have_content("total_places")
    expect(page).to have_content("2")
    expect(page).to have_content("3")
  end

  scenario "It displays the total_chairs at a each post code" do
    StreetCafe.create(name: "Lennys Cafe", address:"123 Castle Drive", postcode: "LS1 FBN", chairs_num: 20)
    StreetCafe.create(name: "Margeries Cafe", address:"123 LeMond Drive", postcode: "LS1 FBN", chairs_num: 30)

    visit '/cafes'
    expect(page).to have_content("total_chairs")
    expect(page).to have_content("50")
  end
  
end
