class PurchasesController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
    @user = current_user
    if @user.credit_card.present?
      # 前前前回credentials.yml.encに記載したAPI秘密鍵を呼び出します。
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      # ログインユーザーのクレジットカード情報を引っ張ってきます。
      @card = CreditCard.find_by(user_id: current_user.id)
      # (以下は以前のcredit_cardsコントローラーのshowアクションとほぼ一緒です)
      # ログインユーザーのクレジットカード情報からPay.jpに登録されているカスタマー情報を引き出す
      customer = Payjp::Customer.retrieve(@card.customer_id)
      # カスタマー情報からカードの情報を引き出す
      @customer_card = customer.cards.retrieve(@card.card_id)

      ##カードのアイコン表示のための定義づけ
      @card_brand = @customer_card.brand
      case @card_brand
      when "Visa"
        # 例えば、Pay.jpからとってきたカード情報の、ブランドが"Visa"だった場合は返り値として
        # (画像として登録されている)Visa.pngを返す
        @card_src = "visacard.svg"
      when "JCB"
        @card_src = "jcbcard.svg"
      when "MasterCard"
        @card_src = "mastercard.svg"
      when "American Express"
        @card_src = "amexcard.svg"
      when "SaisonCard"
        @card_src = "saisoncard.svg"
      end
      # viewの記述を簡略化
        ## 有効期限'月'を定義
        @exp_month = @customer_card.exp_month.to_s
        ## 有効期限'年'を定義
        @exp_year = @customer_card.exp_year.to_s.slice(2,3)
      else
      end
  end

  def create
  end
end
