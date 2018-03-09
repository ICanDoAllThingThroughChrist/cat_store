require "rails_helper"
RSpec.feature "Users can create new boxes" do 
    scenario "when providing invalid attributes" do
        visit "/"
        click_button "Create Box"
        expect(page).to have_content "Box has not been created."
        expect(page).to have_content "Name can't be blank"
      end

end