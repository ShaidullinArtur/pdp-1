require "rails_helper"

feature "Create Article" do
  include_context "current user signed in"

  scenario "User create new article" do
    visit new_article_path

    expect(page).to have_content("New Article")

    within ".new_article" do
      fill_in "Title", with: "New Article Title"
      fill_in "Text", with: "New Article Text"

      expect { click_button("Create Article") }.to change(Article, :count).by(1)
    end

    expect(page).to have_content("Article was successfully created.")
    expect(page).to have_content("New Article Title")
    expect(page).to have_content("New Article Text")
  end

  scenario "User create new article with invalid params" do
    visit new_article_path

    expect(page).to have_content("New Article")

    within ".new_article" do
      fill_in "Title", with: "New Article Title"

      expect { click_button("Create Article") }.not_to change(Article, :count)
    end

    expect(page).to have_content("Article could not be created.")
    expect(page).to have_content("can't be blank")
  end
end
