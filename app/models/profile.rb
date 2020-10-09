class Profile < ApplicationRecord
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birth_day, presence: true
  validates :destination_family_name, presence: true
  validates :destination_first_name, presence: true
  validates :destination_family_name_kana, presence: true
  validates :destination_first_name_kana, presence: true
  validates :post_code, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :house_number, presence: true
  validates :phone_number, uniqueness: true
  belongs_to :user
end
