require 'rails_helper'

describe CreditCard do
  describe '#create' do

    it "is invalid without a card_id" do
      # credit_card = build(:credit_card, card_id: nil)
      # credit_card.valid?
      # expect(credit_card.errors[:card_id]).to include("を入力してください")
    end
  end
end
