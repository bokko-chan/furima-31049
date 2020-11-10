class ItemsController < ApplicationController  
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only:[:show, :destroy]

  def index
    @items = Item.all.order(created_at: :DESC)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
  end

  def destroy
    if @item.destroy
      redirect_to action: :index
    end
  end
  
  private
    def item_params
      params.require(:item).permit(:title, :explain, :category_id, :status_id, :carriage_id, :area_id, :shipping_id, :price, :image).merge(user_id: current_user.id)
    end

    def set_item
      @item = Item.find(params[:id])
    end
end
