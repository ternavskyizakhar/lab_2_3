class User < ApplicationRecord
  has_many :transactions, dependent: :destroy
  has_many :accounts, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  def self.ransackable_associations(auth_object = nil)
    %w[transactions accounts]
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[name email transactions_id created_at updated_at]
  end
end
