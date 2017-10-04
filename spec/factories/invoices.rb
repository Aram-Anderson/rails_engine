FactoryGirl.define do
  factory :invoice do
    status "shipped"
    merchant
    customer
    created_at "2012-03-27 14:54:09 UTC"
    updated_at "2012-03-27 14:54:09 UTC"
  end
end
