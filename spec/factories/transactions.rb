FactoryGirl.define do
  factory :transaction do
    credit_card_number 1
    credit_card_expiration_date nil
    result "success"
    invoice
    created_at Time.now
    updated_at Time.now
  end
end
