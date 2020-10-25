class Purchase < ApplicationRecord
  belongs_to :buyer, optional: true
  belongs_to :item
end
