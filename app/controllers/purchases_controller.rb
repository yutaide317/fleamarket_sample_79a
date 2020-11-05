class PurchasesController < ApplicationController
  require "payjp"
  def new
    @item = Item.find(params[:item_id])
    @user = current_user
    if @user.credit_card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      @card = CreditCard.find_by(user_id: current_user.id)
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @customer_card = customer.cards.retrieve(@card.card_id)
      @card_brand = @customer_card.brand
      case @card_brand
      when "Visa"
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
        @exp_month = @customer_card.exp_month.to_s
        @exp_year = @customer_card.exp_year.to_s.slice(2,3)
      else
        redirect_to new_credit_card_path, alert: "クレジットカードを登録してください"
      end
  end

  def create
    @item = Item.find(params[:item_id])
    if @item.purchase.present?
      redirect_to item_path(@item.id), alert: "売り切れています。"
    else
      @item.with_lock do
        if current_user.credit_card.present?
          @card = CreditCard.find_by(user_id: current_user.id)
          Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
          charge = Payjp::Charge.create(
          amount: @item.price,
          customer: Payjp::Customer.retrieve(@card.customer_id),
          currency: 'jpy'
          )
        else
      
        end
      @purchase = Purchase.create(user_id: current_user.id, item_id: params[:item_id])
      end
    end
  end
end
