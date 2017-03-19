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

end
gs
