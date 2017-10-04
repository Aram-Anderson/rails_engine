FactoryGirl.define do
  factory :invoice do
    status "shipped"
    merchant
    customer
    created_at Time.now
    updated_at Time.now
  end
end
