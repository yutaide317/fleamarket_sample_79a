class CreditCard < ApplicationRecord
  belongs_to :user

  validates :card_id, presence: true
end
