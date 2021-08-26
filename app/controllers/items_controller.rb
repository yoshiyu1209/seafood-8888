class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = '商品が出品されました。'
      redirect_to root_path(@item)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      flash[:notice] = '商品情報が更新されました。'
      redirect_to item_path, method: :get
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    flash[:notice] = "出品情報を削除しました。"
    redirect_to root_path
  end

  private

  def item_params
    params[:item].permit(:image, :title, :text, :weight, :area_id, :catch_day, :classone_id, :tighten, :process, :process_timing,
                         :storage_id, :shipping_charges_id, :days_to_ship_id, :delivery_id, :shipping_area_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == @item.user.id
  end
end
