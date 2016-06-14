require 'rails_helper'

feature 'user can search by zip' do
  scenario 'successfully' do
    VCR.use_cassette("features", record: :new_episodes) do
      visit root_path

      fill_in "search", with: "80202"
      click_on "submit"

      expect(current_path).to eq "/search"
      expect(page).to have_content "17 Total Stores"
      expect(page).to have_content "Best Buy Mobile - Cherry Creek Shopping Center"
      expect(page).to have_content "City: Denver"
      expect(page).to have_content "Distance: 3.25"
      expect(page).to have_content "Phone number: 303-270-9189"
      expect(page).to have_content "Store type: Mobile"

      expect(page).to have_content "Best Buy - S.E. Aurora"
      expect(page).to have_content "City: Aurora"
      expect(page).to have_content "Distance: 18.51"
      expect(page).to have_content "Phone number: 303-693-0166"
      expect(page).to have_content "Store type: BigBox"
    end
  end
end
