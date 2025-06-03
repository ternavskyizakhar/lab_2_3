class AccountSerializer < ActiveModel::Serializer
  attributes :balance

  belongs_to :user
end
