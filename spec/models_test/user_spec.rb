require 'rails_helper'
describe User do
  describe '#create' do
    # 1. nickname、email、password、password_confirmation、family_name,first_name,family_name_kana,first_name_kana,birth_day,destination_family_name,destination_first_name,destination_family_name_kana,destination_first_name_kana,post_code,prefecture,city,house_numberが存在すれば登録できること
    it "is valid with a nickname, email, password, password_confirmation, family_name,first_name,family_name_kana,first_name_kana,birth_day,destination_family_name,destination_first_name,destination_family_name_kana,destination_first_name_kana,post_code,prefecture,city,house_number" do
      user = build(:user)
      expect(user).to be_valid
    end

    # 2. nicknameが空では登録できないこと
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    # 3. emailが空では登録できないこと
    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    # 4. passwordが空では登録できないこと
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    # 5. passwordが存在してもpassword_confirmationが空では登録できないこと
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    # 6. passwordが6文字以下であれば登録できないこと
    it "is invalid with a password that has less than 6 characters " do
      user = build(:user, password: "000000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    # 7. passwordが7文字以上であれば登録できること
    it "is valid with a password that has more than 7 characters " do
      user = build(:user, password: "aaaaaaa", password_confirmation: "aaaaaaa")
      expect(user).to be_valid
    end

    # 8. 重複したemailが存在する場合登録できないこと
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    # 9. emailが＠とドメインがないと登録できないこと
    it "is invalid without @ and domain a password " do
      user = build(:user, email: "aaaa")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end
  end
end