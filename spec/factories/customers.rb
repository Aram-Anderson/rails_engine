FactoryGirl.define do
  factory :customer do
    first_name "First"
    last_name "Last"
    created_at Time.now
    updated_at Time.now
  end
end
