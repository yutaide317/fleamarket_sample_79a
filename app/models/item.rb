class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to_active_hash :itemcondition
  belongs_to_active_hash :postage
  belongs_to_active_hash :district
  belongs_to_active_hash :preparation

  belongs_to :user, optional: true
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  has_one :purchase  

  validates :images, presence: { message: 'を１枚以上アップロードしてください' }
  validates :name, presence: true, length: { maximum: 40, message: 'を40文字以内で設定してください' }
  validates :introduction, presence: true, length: { maximum: 1000, message: 'を1000文字以内で設定してください' }
  validates :category, presence: { message: 'を３つ選択してください' }
  validates :item_condition, presence: { message: 'を選択してください' }
  validates :postage_payer, presence: { message: 'を選択してください' }
  validates :prefecture, presence: { message: 'を選択してください' }
  validates :preparation_period, presence: { message: 'を選択してください' }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'は300〜9999999円の間で設定してください' } 

  validates :brand_id, length: { maximum: 20 }, allow_blank: true
  
end
