FactoryGirl.define do
  factory :article do
    user { build :user }
    title { Faker::Lorem.sentence }
    text { Faker::Lorem.paragraph }
  end

end
