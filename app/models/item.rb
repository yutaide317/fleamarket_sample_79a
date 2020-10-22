class Item < ApplicationRecord
  belongs to :user
  has_many :categories
  has_many :item_images
  belongs to :brand
end
