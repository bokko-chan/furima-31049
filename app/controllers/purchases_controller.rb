class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:id])
    # @adress = Adress.all
  end

  def create
    Adress.create(address_params)
  end

  private

  def address_params
    params.require(:address).permit(:postal, :prefecture_id, :municipality, :street, :building, :phone).merge(user_id: current_user.id)

end
