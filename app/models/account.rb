class Account < ApplicationRecord
  belongs_to :user

  validates :balance, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def self.ransackable_associations(auth_object = nil)
    %w[user]
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[balance user_id created_at updated_at] # Include user_id
  end
end
