class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  # before_action :move_to_index, except: [:index, :show]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item)
    else
      render :new
    end
  end

  private

  def item_params
    params[:item].permit(:image, :title, :text, :weight, :area_id, :catch_day, :classone_id, :tighten, :process, :process_timing, :storage_id, :shipping_charges_id, :days_to_ship_id, :delivery_id, :shipping_area_id, :price).merge(user_id: current_user.id)
  end

  # def move_to_index
  #   redirect_to action: :index unless user_signed_in?
  # end
end
