require "rails_helper"

feature "About Us" do
  scenario "User see about us page" do
    visit about_path

    expect(page).to have_content("About Us")
  end
end
