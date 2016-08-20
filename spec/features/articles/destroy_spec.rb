require "rails_helper"

feature "Destroy Article" do
  include_context "current user signed in"

  context "when user visit self article", js: true do
    let!(:article) { create(:article, author: current_user) }

    scenario "User destroy article" do
      visit article_path(article)

      page.accept_confirm do
        click_on("Destroy Article")
      end

      expect(page).to have_content("Article was successfully destroyed.")
    end
  end
end
