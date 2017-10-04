class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :result, :invoice_id
end
