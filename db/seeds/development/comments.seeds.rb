after "development:articles" do
  Article.all.each do |article|
    10.times do
      random_user = User.offset(rand(User.count)).first
      FactoryGirl.create(:comment, article: article, user: random_user)
    end
  end
end
