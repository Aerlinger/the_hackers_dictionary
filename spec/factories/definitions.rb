FactoryGirl.define do
  factory :category do |f|
    f.name { Faker::Lorem.words(1) }
  end
end