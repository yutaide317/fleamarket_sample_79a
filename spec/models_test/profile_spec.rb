require 'rails_helper'
describe Profile do
  describe '#create' do
    # 10. family_nameが空では登録できない
    it "is invalid without a family_name" do
      profile = build(:profile, family_name: nil)
      profile.valid?
      expect(profile.errors[:family_name]).to include("を入力してください")
    end

    # 11. first_nameが空では登録できない
    it "is invalid without a first_name" do
      profile = build(:profile, first_name: nil)
      profile.valid?
      expect(profile.errors[:first_name]).to include("を入力してください")
    end

    # 12. family_name_kanaが空では登録できない
    it "is invalid without a family_name_kana" do
      profile = build(:profile, family_name_kana: nil)
      profile.valid?
      expect(profile.errors[:family_name_kana]).to include("を入力してください")
    end
    
    # 13. first_name_kanaが空では登録できない
    it "is invalid without a first_name_kana" do
      profile = build(:profile, first_name_kana: nil)
      profile.valid?
      expect(profile.errors[:first_name_kana]).to include("を入力してください")
    end

    # 14. birth_dayが空では登録できない
    it "is invalid without a birth_day" do
      profile = build(:profile, birth_day: nil)
      profile.valid?
      expect(profile.errors[:birth_day]).to include("を入力してください")
    end

    # 15. destination_family_nameが空では登録できない
    it "is invalid without a destination_family_name" do
      profile = build(:profile, destination_family_name: nil)
      profile.valid?
      expect(profile.errors[:destination_family_name]).to include("を入力してください")
    end

    # 16. destination_first_nameが空では登録できない
    it "is invalid without a destination_first_name" do
      profile = build(:profile, destination_first_name: nil)
      profile.valid?
      expect(profile.errors[:destination_first_name]).to include("を入力してください")
    end

    # 17. post_codeが空では登録できない
    it "is invalid without a post_code" do
      profile = build(:profile, post_code: nil)
      profile.valid?
      expect(profile.errors[:post_code]).to include("を入力してください")
    end

    # 18. prefectureが空では登録できない
    it "is invalid without a prefecture" do
      profile = build(:profile, prefecture: nil)
      profile.valid?
      expect(profile.errors[:prefecture]).to include("を入力してください")
    end

    # 19. cityが空では登録できない
    it "is invalid without a city" do
      profile = build(:profile, city: nil)
      profile.valid?
      expect(profile.errors[:city]).to include("を入力してください")
    end
    
    # 20. house_numberが空では登録できない
    it "is invalid without a house_number" do
      profile = build(:profile, house_number: nil)
      profile.valid?
      expect(profile.errors[:house_number]).to include("を入力してください")
    end

    # 21. family_nameが全角でなければでは登録できない
    it "is invalid only register in full-width a family_name" do
      profile = build(:profile, family_name: "ｲﾃﾞ")
      profile.valid?
      expect(profile.errors[:family_name]).to include("は不正な値です")
    end

    # 22. first_nameが全角でなければでは登録できない
    it "is invalid only register in full-width a first_name" do
      profile = build(:profile, first_name: "ｻﾄｼﾞ")
      profile.valid?
      expect(profile.errors[:first_name]).to include("は不正な値です")
    end

    # 23. family_name_kanaが全角でなければでは登録できない
    it "is invalid only register in full-width a family_name_kana" do
      profile = build(:profile, family_name_kana: "ｲﾃﾞ")
      profile.valid?
      expect(profile.errors[:family_name_kana]).to include("は不正な値です")
    end

    # 24. first_name_kanaが全角でなければでは登録できない
    it "is invalid only register in full-width a first_name_kana" do
      profile = build(:profile, first_name_kana: "ｻﾄｼﾞ")
      profile.valid?
      expect(profile.errors[:first_name_kana]).to include("は不正な値です")
    end

    # 25. post_codeがハイフンなし７桁でなければでは登録できない
    it "is invalid only register with 7 digits without hyphens a post_code" do
      profile = build(:profile, post_code: "120-000")
      profile.valid?
      expect(profile.errors[:post_code]).to include("は不正な値です")
    end
  end
end
