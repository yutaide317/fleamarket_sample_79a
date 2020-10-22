class Item < ApplicationRecord
  belongs_to :user
  has_many :categories
  has_many :item_images
  belongs_to :brand
end
