require "rails_helper"
RSpec.feature "Users can edit existing boxes" do
  before do
    FactoryBot.create(:box, title: "Sublime Text 3",
      month: "January", year: "2018",
      subscription_level: "level_one")
    visit "/"
    click_link "Sublime Text 3"
    click_link "Edit Box"
  end
  scenario "with valid attributes" do
    fill_in "Title", with: "Sublime Text 4 beta"
    click_button "Update Box"
    expect(page).to have_content "box has been updated."
    expect(page).to have_content "Sublime Text 4 beta"
  end
  scenario "when providing invalid attributes" do
    fill_in "Title", with: ""
    click_button "Update Box"
    expect(page).to have_content "Box has not been updated."
  end
end