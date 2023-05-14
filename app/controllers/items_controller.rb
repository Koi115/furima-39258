class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]
  before_action :move_to_index2, only: [:edit]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @order = Order.find_by(item_id: @item.id)
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to "/items/#{@item.id}"
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end


  private

  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :status_id, :fee_id, :prefecture_id, :period_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless @item.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def move_to_index2
    @order = Order.find_by(item_id: @item.id)
    unless @order.nil?
      redirect_to root_path
    end 
  end


end
