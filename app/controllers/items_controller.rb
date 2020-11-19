class ItemsController < ApplicationController

  before_action :user_check, only: [:new, :create]
  before_action :set_item, except: [:index, :new, :create, :show, :get_category_children, :get_category_grandchildren]

  def index
    @items = Item.includes(:images).where(user: current_user).order('created_at DESC')
    @categories = Item.includes(:images).where(category_id: 1..195).order('created_at DESC')
    @new_items = Item.includes(:images).order('created_at DESC')

  end

  def new
    @item = Item.new
    @item.images.new

    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    @category_parent_array = Category.where(ancestry: nil)
  end

  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find(params[:parent_id]).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  def show
    @item = Item.find(params[:id])
    @grandchild = Category.find(@item.category_id)
    @child = @grandchild.parent
    @parent = @child.parent
    # @itemcategory = Itemcategory.find(@item.category)
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
    @item = Item.find(params[:id])
    # # カテゴリーデータ取得
    @grandchild = @item.category
    @child = @grandchild.parent
    @parent = @child.parent

    #カテゴリー一覧を作成
    @category = Category.where(ancestry: nil)
    # 紐づく孫カテゴリーの親（子カテゴリー）の一覧を配列で取得
    @category_children = @item.category.parent.parent.children
    # 紐づく孫カテゴリーの一覧を配列で取得
    @category_grandchildren = @item.category.parent.children
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
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
      :category_id, 
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

  def user_check
    unless user_signed_in?
      redirect_to new_user_session_path, alert: "ログインしてください"
    end
  end

  #親カテゴリー
  def set_category  
    @category_parent_array = Category.where(ancestry: nil)
  end

end
