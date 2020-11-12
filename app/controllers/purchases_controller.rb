class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    # binding.pry
    @item = Item.find(params[:item_id])
    # @address = Address.new
  end

  def create
    @address = Address.new(address_params)
      if @address.save
        redirect_to root_path
      else
        render :index
      end
  end

  private

  def address_params
    params.require(:address).permit(:postal, :prefecture_id, :municipality, :street, :building, :phone)#.merge(user_id: current_user.id)
  end
end
