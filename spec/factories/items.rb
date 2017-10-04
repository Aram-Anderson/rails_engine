FactoryGirl.define do
  factory :item do
    name "Item"
    description "An item"
    unit_price 1000
    merchant
    created_at "2012-03-27 14:54:09 UTC"
    updated_at "2012-03-27 14:54:09 UTC"
  end
end
