FactoryGirl.define do
  factory :invoice_item do
    quantity 1
    unit_price 1000
    item
    invoice
  end
end
