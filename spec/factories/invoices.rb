FactoryGirl.define do
  factory :invoice do
    status "Invoice"
    merchant
    customer
  end
end
