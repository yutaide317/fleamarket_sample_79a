class Image < ApplicationRecord
  mount_uploader :src, ImageUploader
  belongs_to :item
  validates :src, presence: true
end
