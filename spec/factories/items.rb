FactoryGirl.define do
  factory :item do
    name "Item"
    description "An item"
    unit_price 1000
    merchant
    created_at Time.now
    updated_at Time.now
  end
end
