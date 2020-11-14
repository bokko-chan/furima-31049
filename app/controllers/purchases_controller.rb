class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only:[:index, :create]
  
  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    # binding.pry
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      @item
      render :index
    end
  end

  private
  def purchase_address_params
    params.require(:purchase_address).permit(:postal, :prefecture_id, :municipality, :street, :building, :phone, :user_id, :item_id).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_address_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
