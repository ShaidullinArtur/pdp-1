require "rails_helper"

feature "Articles" do
  let!(:articles) { create_list(:article, 2) }

  scenario "User see articles list on root page" do
    visit root_path

    articles.each do |article|
      expect(page).to have_content(article.title)
    end
  end

  scenario "Visitor not see new article button" do
    visit root_path

    expect(page).not_to have_link("New Article", new_article_path)
  end

  context "when user signed in" do
    include_context "current user signed in"

    scenario "User see new article button" do
      visit root_path

      expect(page).to have_link("New Article", new_article_path)
    end
  end
end
