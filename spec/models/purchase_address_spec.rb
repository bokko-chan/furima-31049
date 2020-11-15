require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @purchase_address = build(:purchase_address)
    end
    subject { @purchase_address.errors.full_messages }

      context '購入できるとき' do
        it 'すべての値が正しく入力されていれば購入できる' do
          @purchase_address.valid?
          expect(@purchase_address).to be_valid
        end

        it 'buildingは空でも購入できる' do
          @purchase_address.building = nil
          expect(@purchase_address).to be_valid
        end
      end

      context '購入できないとき' do
        it 'tokenが空では購入できない' do
          @purchase_address.token = nil
          @purchase_address.valid?
          is_expected.to include("Token can't be blank")
        end

        it 'postalが空では購入できない' do
          @purchase_address.postal = nil
          @purchase_address.valid?
          is_expected.to include("Postal can't be blank")
        end

        it 'postalがハイフンを含んだ半角数字7文字でないと購入できない' do
          @purchase_address.postal = '1234567'
          @purchase_address.valid?
          is_expected.to include("Postal is invalid")
        end

        it 'prefecture_idが空では購入できない' do
          @purchase_address.prefecture_id = 1
          @purchase_address.valid?
          is_expected.to include("Prefecture must be other than 1")
        end

        it 'municipalityが空では購入できない' do
          @purchase_address.municipality = nil
          @purchase_address.valid?
          is_expected.to include("Municipality can't be blank")
        end

        it 'streetが空では購入できない' do
          @purchase_address.street = nil
          @purchase_address.valid?
          is_expected.to include("Street can't be blank")
        end

        it 'phoneが空では購入できない' do
          @purchase_address.phone = nil
          @purchase_address.valid?
          is_expected.to include("Phone can't be blank")
        end

        it 'phoneが半角数字11文字以内でないと登録できない' do
          @purchase_address.phone = '090123456789'
          @purchase_address.valid?
          is_expected.to include("Phone is invalid")
        end    
      end

  end
end
