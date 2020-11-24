class UsersController < ApplicationController
  def index
  end

  def show
  end

  def sold_items
    @sold_items = Item.includes(:images).where(user: current_user).order('created_at DESC')
  end
end


