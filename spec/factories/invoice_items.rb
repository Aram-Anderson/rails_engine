FactoryGirl.define do
  factory :invoice_item do
    quantity 1
    unit_price 1000
    item
    invoice
    created_at Time.now
    updated_at Time.now
  end
end
