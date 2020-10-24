class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :itemcategory
  belongs_to_active_hash :itemcondition
  belongs_to_active_hash :postage
  belongs_to_active_hash :district
  belongs_to_active_hash :preparation

  belongs_to :user
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
end
