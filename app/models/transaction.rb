class Transaction < ApplicationRecord
  belongs_to :user

  after_create do
    user.balance += amount

    unless user.save
      errors[:user].concat user.errors.full_messages
      raise ActiveRecord::RecordInvalid
    end
  end

  validates :amount, numericality: { other_than: 0 }
end
