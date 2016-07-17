FactoryGirl.define do
  factory :article do
    author { build :user }
    title { Faker::Lorem.sentence(20) }
    text { Faker::Lorem.paragraph(20) }
  end
end
