require 'rails_helper'

RSpec.describe Account, type: :model do
  describe "a associations" do
    it { should belong_to(:user) }
  end
  describe "a validations" do
    it { should validate_presence_of(:balance) }
    it { should validate_numericality_of(:balance).is_greater_than_or_equal_to(0) }
  end
end
