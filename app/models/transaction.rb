class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :receiver, class_name: "Account"

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :account, :receiver, presence: true

  def self.ransackable_associations(auth_object = nil)
    %w[account receiver]
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[amount account_id receiver_id created_at updated_at]
  end
end
