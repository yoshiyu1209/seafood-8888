class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @item_order = ItemOrder.new
  end

  def create
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      @item_order.save
      redirect_to root_path(@item)
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:item_order).permit(:postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id]
    )
  end

  # def pay_item
  #   Payjp.api_key = ENV['PAYJP_SECRET_KEY']
  #   Payjp::Charge.create(
  #     amount: @item.price,
  #     card: order_params[:token],
  #     currency: 'jpy'
  #   )
  # end

  def move_to_index
    redirect_to root_path unless current_user.id != @item.user.id
  end
end
