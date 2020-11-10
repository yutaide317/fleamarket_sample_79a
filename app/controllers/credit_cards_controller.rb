class CreditCardsController < ApplicationController
  require "payjp"
  before_action :set_card, except: [:new, :create]

  def new
    @card = CreditCard.where(user_id: current_user.id)
    redirect_to credit_card_path(current_user.id) if @card.exists?
  end

  def create
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    if params["payjp_token"].blank?
      redirect_to new_credit_card_path, alert: 'クレジットカード情報を正しく入力してください'
    else
      customer = Payjp::Customer.create(
        email: current_user.email,
        card: params["payjp_token"],
        metadata: {user_id: current_user.id}
      )
      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to credit_card_path(current_user.id), notice: 'クレジットカードの登録が完了しました'
      else
        redirect_to action: "create"
      end
    end
  end

  def show
    
    if @card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
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
    end
  end

  def destroy
    
    if @card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
      unless @card.destroy
        redirect_to credit_card_path(current_user.id)
      end
    end
  end
  
  private

  def set_card
    @card = CreditCard.find_by(user_id: current_user.id)
  end

end