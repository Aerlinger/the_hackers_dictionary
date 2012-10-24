FactoryGirl.define do
  factory :definition do
    sequence(:word) { |n| "word_#{n}" }
    sequence(:definition_text) { |n| "This is the definition for word_#{n}" }
    sequence(:tags) {|n| ["first_tag#{n}", "second_tag#{n}", "third_tag#{n}"] }
  end
end