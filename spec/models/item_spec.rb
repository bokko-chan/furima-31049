require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = build(:item)
  end

  describe '商品出品登録' do

    context '出品できるとき' do
      it '出品登録の全フォームが入力されていれば登録できる' do
        @item.valid?
        expect(@item).to be_valid
      end
    end

    context '出品できないとき' do
      it 'titleが空では保存できない' do
        @item.title = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'explainが空では保存できない' do
        @item.explain = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end
      it 'categoty_idが空では保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'status_idが空では保存できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it 'carriage_idが空では保存できない' do
        @item.carriage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Carriage must be other than 1")
      end
      it 'area_idが空では保存できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 1")
      end
      it 'send_idが空では保存できない' do
        @item.send_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Send must be other than 1")
      end
      it 'priceが空では保存できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'priceが半角数字以外では保存できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが¥300以上でなければ保存できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが¥9,999,999以下でなければ保存できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end

  end
end
