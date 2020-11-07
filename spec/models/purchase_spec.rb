require 'rails_helper'

describe Purchase do
  describe '#create' do
    # 1.user_idなしでは登録できない
    it "is invalid without a user_id" do
      purchase = build(:purchase, user_id: nil)
      purchase.valid?
      expect(purchase.errors[:user_id]).to include("を入力してください")
    end
    # 2.item_idなしでは登録できない
    it "is invalid without a item_id" do
      purchase = build(:purchase, item_id: nil)
      purchase.valid?
      expect(purchase.errors[:item_id]).to include("を入力してください")
    end
  end
end
