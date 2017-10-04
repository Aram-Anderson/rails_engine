FactoryGirl.define do
  factory :item do
    name "Item"
    description "An item"
    unit_price 1000
    merchant
  end
end
