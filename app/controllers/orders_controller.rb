class OrdersController < ApplicationController

  before_action :authenticate_user!, only: [:index]
  before_action :move_to_root, only: [:index]
  before_action :move_to_root2, only: [:index]
  before_action :set_item, only: [:index, :create]


  def index
    @order_address = OrderAddress.new
  end


  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end


  def move_to_root
    set_item
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def move_to_root2
    set_item
    @order = Order.find_by(item_id: @item.id)
    unless @order.nil?
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end





end

