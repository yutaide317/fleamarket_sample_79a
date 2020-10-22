class ItemsController < ApplicationController
  def index
  end
  def new
    @item = Item.new
    @item.item_images.new
  end
  
end
