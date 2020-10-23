class Item < ApplicationRecord
  belongs_to :user
  has_many :categories
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true
  belongs_to :brand
end
