# class UserItemListsController < ApplicationController
#   def index
#     @items = Item.includes(:images).where(user: current_user).order('created_at DESC')
#   end

#   def show
#   end
# end
