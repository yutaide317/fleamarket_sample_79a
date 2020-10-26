class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :itemcategory
  belongs_to_active_hash :itemcondition
  belongs_to_active_hash :postage
  belongs_to_active_hash :district
  belongs_to_active_hash :preparation

  belongs_to :user, optional: true
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  has_one :purchase

  
  with_options presence: true do
    validates :images
    validates :category
    validates :item_condition
    validates :postage_payer
    validates :prefecture
    validates :preparation_period
    validates :name,                length: { maximum: 40 }
    validates :introduction,        length: { maximum: 1000 }
    validates :price,               numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999,
                                    message: 'は300〜9999999円の間で設定してください' }

  end
  validates :brand_id, length: { maximum: 20 }, allow_blank: true
  
  validate  :images_count
  
  private
    def images_count
      if images.images.count == 0
        errors.add(images, "写真は１枚以上")
      ifelse images.images.count > 10
        errors.add(images, "写真は10枚以内")
      end
    end
end
