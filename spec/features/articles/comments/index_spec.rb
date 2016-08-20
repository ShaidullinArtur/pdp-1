require "rails_helper"

feature "Article Comments" do
  let!(:article) { create(:article) }

  context "when article with comments" do
    let!(:comments) { create_list(:comment, 2, user: article.author, article: article) }

    scenario "User see article comments list on article page" do
      visit article_path(article)

      expect(page).to have_content("Comments")

      comments.each do |comment|
        expect(page).to have_content(comment.text)
      end
    end
  end

  scenario "Visitor not see new comment form" do
    visit article_path(article)

    expect(page).not_to have_selector(".comments-form")
    expect(page).not_to have_button("Create Comment")
  end

  context "when user signed in" do
    include_context "current user signed in"

    scenario "User see new comment form" do
      visit article_path(article)

      expect(page).to have_selector(".comments-form")
      expect(page).to have_button("Create Comment")
    end
  end
end
