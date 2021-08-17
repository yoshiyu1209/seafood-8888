require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @item_order = FactoryBot.build(:item_order, user_id: @user.id, item_id: @item.id)
    sleep(0.5)
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it '全項目が存在すれば購入できる' do
        expect(@item_order).to be_valid
      end
      it 'postal_codeが「3桁ハイフン4桁」であれば購入できる' do
        @item_order.postal_code = '888-8888'
        expect(@item_order).to be_valid
      end
      it 'phone_numberが10桁であれば購入できる' do
        @item_order.phone_number = '0808888888'
        expect(@item_order).to be_valid
      end
      it 'phone_numberが11桁であれば購入できる' do
        @item_order.phone_number = '08088888888'
        expect(@item_order).to be_valid
      end
      it 'building_nameが空でも購入できる' do
        @item_order.building_name = ''
        expect(@item_order).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'tokenが空だと購入できない' do
        @item_order.token = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('クレジットカード情報を入力してください')
      end
      it 'postal_codeが空だと購入できない' do
        @item_order.postal_code = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('郵便番号を入力してください', '郵便番号は半角で入力してください (例 123-4567)')
      end
      it 'postal_codeが半角英数字混合では購入できない' do
        @item_order.postal_code = 'abc8888'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('郵便番号は半角で入力してください (例 123-4567)')
      end
      it 'postal_codeにハイフンがないと購入できない' do
        @item_order.postal_code = '1_2345_67'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('郵便番号は半角で入力してください (例 123-4567)')
      end
      it 'shipping_area_idが空では購入できない' do
        @item_order.shipping_area_id = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('都道府県を入力してください', '都道府県を入力してください')
      end
      it 'shipping_area_idが1では購入できない' do
        @item_order.shipping_area_id = 1
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('都道府県を入力してください')
      end
      it 'municipalityが空では購入できない' do
        @item_order.municipality = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('市区町村を入力してください')
      end
      it 'addressが空では購入できない' do
        @item_order.address = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('番地を入力してください')
      end
      it 'phone_numberが空では購入できない' do
        @item_order.phone_number = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('電話番号を入力してください', '電話番号が不正確です', '電話番号は半角数値で入力してください')
      end
      it 'phone_numberにハイフンがあると購入できない' do
        @item_order.phone_number = '080-8888-8888'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('電話番号が不正確です', '電話番号は半角数値で入力してください')
      end
      it 'phone_numberは半角数値でないと購入できない' do
        @item_order.phone_number = 'aaa000０'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('電話番号が不正確です', '電話番号は半角数値で入力してください')
      end
      it 'phone_numberが9桁では購入できない' do
        @item_order.phone_number = '080888888'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('電話番号が不正確です')
      end
      it 'phone_numberが12桁では購入できない' do
        @item_order.phone_number = '080888888888'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('電話番号が不正確です')
      end
    end
  end
end
