class Purchase < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :item, optional: true

  validates :user_id, presence: true
  validates :item_id, presence: true
end
