class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]


  def index
  end
  def new
    @item = Item.new
    @item.item_images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :category, :brand_id, :item_condition, :postage_payer, :prefecture, :preparation_period, :price, item_images_attributes: [:image_src])
  end

  def set_item
    @item = Item.find(params[:id])
  end


end
