class User < ApplicationRecord
  has_many :transactions, dependent: :destroy

  before_validation(on: :create) do
    self.uuid = SecureRandom.uuid
    self.balance = 0
  end

  validates :balance, numericality: { greater_than_or_equal_to: 0 }
  validates :email, :phone, uniqueness: true, presence: true
end
