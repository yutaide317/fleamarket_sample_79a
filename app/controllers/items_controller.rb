class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create, :show]

  def index
    @items = Item.includes(:images).where(user_id: current_user).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(
      :name, 
      :introduction, 
      :category, 
      :brand_id, 
      :item_condition, 
      :postage_payer, 
      :prefecture, 
      :preparation_period, 
      :price, 
      :user_id, 
      images_attributes: [:src, :_destroy, :id]
    ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
