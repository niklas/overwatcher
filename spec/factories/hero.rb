FactoryGirl.define do
  factory :hero do
    sequence(:name) { |i| "Hero_#{i}" }
    sequence(:real_name) { |i| "Hero the #{i}" }
    health 200
    armor 0
    shield 0
  end
end
