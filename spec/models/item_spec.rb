require 'rails_helper'

describe Item do
  describe '#create' do
    # 1.imagesと name, introduction, category, item_condition, postage_payer, prefecture, preparation_period, price が存在すれば出品登録できること
    it "is valid with images, name, introduction, category, item_condition, postage_payer, prefecture, preparation_period & price" do
      item = build(:item)
      expect(item).to be_valid
    end
    # 2. imagesが空では登録できないこと
    it "is invalid without images" do
      item = Item.new(name: "ハンチョウ全巻",
                      introduction: "漫画『ハンチョウ』全巻です",
                      category: 5,
                      item_condition: 2,
                      postage_payer: 2,
                      prefecture: 1,
                      preparation_period: 1,
                      price: 5000)
      item.valid?
      expect(item.errors[:images]).to include("を１枚以上アップロードしてください")
    end
    # 3. nameが空では登録できないこと
    it "is invalid without a name" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end
    # 4. nameが40文字より多ければ登録できないこと
    it "is invalid with a name that has more than 40 characters" do
      item = build(:item, name: "あいうえおかきくけこあいうえおかきくけこあいうえおかきくけこあいうえおかきくけこあ")
      item.valid?
      expect(item.errors[:name]).to include("を40文字以内で設定してください")
    end
    # 5. introductionが空では登録できないこと
    it "is invalid without an introduction" do
      item = build(:item, introduction: nil)
      item.valid?
      expect(item.errors[:introduction]).to include("を入力してください")
    end
    # 6. introductionが1000文字より多ければ登録できないこと
    it "is invalid with an introduction that has more than 1000 characters" do
      item = build(:item, introduction: "ああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ
                                        いいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいい
                                        うううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううう
                                        ええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええ
                                        おおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおお
                                        ああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ
                                        いいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいい
                                        うううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううう
                                        ええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええええ
                                        おおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおお
                                        か")
      item.valid?
      expect(item.errors[:introduction]).to include("を1000文字以内で設定してください")
    end
    # 7. categoryが空では登録できないこと
    it "is invalid without a category" do
      item = build(:item, category: nil)
      item.valid?
      expect(item.errors[:category]).to include("を選択してください")
    end
    # 8. item_conditionが空では登録できないこと
    it "is invalid without an item_condition" do
      item = build(:item, item_condition: nil)
      item.valid?
      expect(item.errors[:item_condition]).to include("を選択してください")
    end
    # 9. item_conditionが空では登録できないこと
    it "is invalid without a postage_payer" do
      item = build(:item, postage_payer: nil)
      item.valid?
      expect(item.errors[:postage_payer]).to include("を選択してください")
    end
    # 10. prefectureが空では登録できないこと
    it "is invalid without a prefecture" do
      item = build(:item, prefecture: nil)
      item.valid?
      expect(item.errors[:prefecture]).to include("を選択してください")
    end
    # 11. preparation_periodが空では登録できないこと
    it "is invalid without a preparation_period" do
      item = build(:item, preparation_period: nil)
      item.valid?
      expect(item.errors[:preparation_period]).to include("を選択してください")
    end
    # 12. priceが300より少ない数字だったら登録できないこと
    it "is invalid with a price that be less than 300 number" do
      item = build(:item, price: "299")
      item.valid?
      expect(item.errors[:price]).to include("は300〜9999999円の間で設定してください")
    end
    # 13. priceが9999999より多い数字だったら登録できないこと
    it "is invalid with a price that be more than 9999999 number" do
      item = build(:item, price: "10000000")
      item.valid?
      expect(item.errors[:price]).to include("は300〜9999999円の間で設定してください")
    end
    # 14. priceが数字以外の文字では登録できないこと
    it "is valid only with number" do
      item = build(:item, price: "テスト")
      item.valid?
      expect(item.errors[:price]).to include("は300〜9999999円の間で設定してください")
    end
  end
end