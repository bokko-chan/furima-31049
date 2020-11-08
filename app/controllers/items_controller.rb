class ItemsController < ApplicationController  
  before_action :authenticate_user!, except: [:index]

  def index
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

  private
    def item_params
      params.require(:item).permit(:title, :explain, :category_id, :status_id, :carriage_id, :area_id, :send_id, :price, :image).merge(user_id: current_user.id)
    end

end
