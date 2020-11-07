class CreditCard < ApplicationRecord
  belongs_to :user

  # validates :payment_card_no, presence: { message: 'カード番号を入力してください'}
end
