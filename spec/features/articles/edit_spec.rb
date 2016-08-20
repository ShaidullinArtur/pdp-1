require "rails_helper"

feature "Edit Article" do
  include_context "current user signed in"

  context "when user visit self article" do
    let!(:article) { create(:article, author: current_user) }

    scenario "User see edit and destroy button" do
      visit article_path(article)

      expect(page).to have_content("Edit Article")
      expect(page).to have_content("Destroy Article")
    end
  end

  context "when user visit another article" do
    let!(:article) { create(:article) }

    scenario "User not see edit and destroy button" do
      visit article_path(article)

      expect(page).not_to have_content("Edit Article")
      expect(page).not_to have_content("Destroy Article")
    end
  end
end
