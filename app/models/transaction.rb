class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :receiver, class_name: "Account"

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :account, :receiver, presence: true
end
