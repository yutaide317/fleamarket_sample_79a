class Item < ApplicationRecord
  belongs_to :user
  has_many :categories
  accepts_nested_attributes_for :item_images
  belongs_to :brand
end
