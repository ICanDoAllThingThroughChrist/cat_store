require "rails_helper"
        RSpec.feature "Users can view boxes" do
          scenario "with the boxes details" do
            box = FactoryBot.create(:box, title: "Sublime Text 3",
                month: "January", year: "2018",
                subscription_level: "level_one")
            visit "/"
            click_link "Sublime Text 3"
            expect(page.current_url).to eq box_url(box)
end end
