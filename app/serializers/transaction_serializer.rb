class TransactionSerializer < ActiveModel::Serializer
  attributes :amount

  belongs_to :account
  belongs_to :receiver, serializer: AccountSerializer
end
