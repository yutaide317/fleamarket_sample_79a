require 'rails_helper'
describe Profile do
  describe '#create' do
    # 11. family_nameが空では登録できない
    it "is invalid without a family_name" do
      profile = build(:profile, family_name: nil)
      profile.valid?
      expect(profile.errors[:family_name]).to include("を入力してください")
    end

    # 12. first_nameが空では登録できない
    it "is invalid without a first_name" do
      profile = build(:profile, first_name: nil)
      profile.valid?
      expect(profile.errors[:first_name]).to include("を入力してください")
    end

    
  end
end
