require "rails_helper"

feature "Create Article comment", js: true do
  let!(:article) { create(:article) }

  context "when user signed in" do
    include_context "current user signed in"

    scenario "User create new article comment" do
      visit article_path(article)

      within ".comments-form" do
        fill_in "Text", with: "New Comment Text"

        click_button("Create Comment")
      end

      expect(page).to have_selector(".comments-item", text: "New Comment Text")
    end
  end
end
