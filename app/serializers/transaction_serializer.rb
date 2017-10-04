class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :credit_card_number, :credit_card_expiration_date, :result, :invoice_id

  def credit_card_number
    object.credit_card_number.to_s
  end
end
