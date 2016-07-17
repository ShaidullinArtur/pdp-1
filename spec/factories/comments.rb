FactoryGirl.define do
  factory :comment do
    user { build :user }
    article { build :article }
    text { Faker::Lorem.paragraph }
  end
end
