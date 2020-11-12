class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  def create
    # binding.pry
    @purchase_address = PurchaseAddress.new(address_params)
      if @purchase_address.save
        redirect_to root_path
      else
        render :index
      end
  end

  private
  def address_params
    params.require(:purchase_address).permit(:postal, :prefecture_id, :municipality, :street, :building, :phone, :user_id, :item_id)
  end

end
