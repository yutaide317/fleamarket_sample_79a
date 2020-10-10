class Profile < ApplicationRecord
  validates :family_name, presence: true, format: { with: /\A[一-龥ぁ-ん]/}
  validates :first_name, presence: true, format: { with: /\A[一-龥ぁ-ん]/}
  validates :family_name_kana, presence: true, format: { with: /\A[ぁ-んー－]+\z/}
  validates :first_name_kana, presence: true, format: { with: /\A[ぁ-んー－]+\z/}
  validates :birth_day, presence: true
  validates :destination_family_name, presence: true
  validates :destination_first_name, presence: true
  validates :destination_family_name_kana, presence: true
  validates :destination_first_name_kana, presence: true
  validates :post_code, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :house_number, presence: true
  validates :phone_number, format: { with: /\A\d{10,11}\z/}
  belongs_to :user
end
