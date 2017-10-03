FactoryGirl.define do
  factory :item do
    description "Item"
    unit_price 1000
    association :merchant, factory: :merchant
  end
end
