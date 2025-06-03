class User < ApplicationRecord
  has_many :transactions, dependent: :destroy
  has_many :accounts, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
