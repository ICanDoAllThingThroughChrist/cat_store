require "rails_helper"
RSpec.feature "Users can create new boxes" do 
    scenario "with valid attributes" do 
        visit "/boxes/new"
        fill_in "title", with: "Visual Studio Code"
        fill_in "month", with: "March"
        fill_in "year", with: "2018"
        fill_in "subscription_level", with: "level_one"
        click_button "create box"

        expect(page). to have_content "box has been created."
    end
end