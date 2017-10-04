FactoryGirl.define do
  factory :invoice_item do
    quantity 1
    unit_price 1000
    item
    invoice
    created_at "2012-03-27 14:54:09 UTC"
    updated_at "2012-03-27 14:54:09 UTC"
  end
end
