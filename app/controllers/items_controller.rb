class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create, :show, :destroy]

  def index
    @items = Item.includes(:images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def show
    @item = Item.find(params[:id])
    @itemcategory = Itemcategory.find(@item.category)
    @itemcondition = Itemcondition.find(@item.item_condition)
    @postage = Postage.find(@item.postage_payer)
    @preparation = Preparation.find(@item.preparation_period)
    @district = District.find(@item.prefecture)
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @item.images.new
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
    if @item.user_id == current_user.id && @item.destroy
      redirect_to root_path
    else
      render :show
    end
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
