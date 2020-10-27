require 'rails_helper'

describe Item do
  describe '#create' do
    # 1.imagesと name, introduction, category, item_condition, postage_payer, prefecture, preparation_period, price が存在すれば出品登録できること
    it "is valid with images, name, introduction, category, item_condition, postage_payer, prefecture, preparation_period & price" do
      item = build(:item)
      expect(item).to be_valid
    end
  end
end