FactoryGirl.define do

  factory :category do
    sequence(:name) { |n| "category_#{n}" }
  end

  factory :definition do
    sequence(:word) { |n| "word_#{n}" }
    sequence(:definition_text) { |n| "This is the definition for word_#{n}" }
    sequence(:tags) {|n| ["first_tag#{n}", "second_tag#{n}", "third_tag#{n}"] }
  end

  factory :user do
    sequence(:username) { |n| "user#{n}" }
    password_confirmation "secret"
    password "secret"
  end

end