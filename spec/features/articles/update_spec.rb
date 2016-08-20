require "rails_helper"

feature "Update Article" do
  include_context "current user signed in"

  let!(:article) { create(:article, author: current_user) }

  scenario "User update his article" do
    visit edit_article_path(article)

    expect(page).to have_content("Edit #{article.title}")

    within ".edit_article" do
      fill_in "Title", with: "Updated Article Title"
      fill_in "Text", with: "Updated Article Text"

      click_button("Update Article")
    end

    expect(page).to have_content("Article was successfully updated.")
    expect(page).to have_content("Updated Article Title")
    expect(page).to have_content("Updated Article Text")
  end

  scenario "User update his article with invalid params" do
    visit edit_article_path(article)

    expect(page).to have_content("Edit #{article.title}")

    within ".edit_article" do
      fill_in "Title", with: "Updated Article Title"
      fill_in "Text", with: ""

      click_button("Update Article")
    end

    expect(page).to have_content("Article could not be updated.")
    expect(page).to have_content("can't be blank")
  end
end
