after "development:users" do
  User.all.each do |user|
    FactoryGirl.create_list(:article, 10, author: user)
  end
end
