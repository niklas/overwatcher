FactoryGirl.define do
  factory :ability do
    sequence(:name) { |i| "Ability ##{i}" }
    description "Do not try at home"
    is_ultimate false
  end
end
