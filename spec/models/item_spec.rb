require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it '全項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do
      it 'titleが空では出品できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'textが空では出品できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'weightが空では出品できない' do
        @item.weight = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Weight can't be blank")
      end
      it 'area_idが空では出品できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it 'area_idが1では出品できない' do
        @item.area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it 'catch_dayが空では出品できない' do
        @item.catch_day = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Catch day can't be blank")
      end
      it 'classone_idが空では出品できない' do
        @item.classone_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Classone can't be blank")
      end
      it 'classone_idが1では出品できない' do
        @item.classone_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Classone can't be blank")
      end
      it 'tightenが空では出品できない' do
        @item.tighten = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Tighten can't be blank")
      end
      it 'processが空では出品できない' do
        @item.process = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Process can't be blank")
      end
      it 'process_timingが空では出品できない' do
        @item.process_timing = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Process timing can't be blank")
      end
      it 'storage_idが空では出品できない' do
        @item.storage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Storage can't be blank")
      end
      it 'storage_idが1では出品できない' do
        @item.storage_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Storage can't be blank")
      end
      it 'shipping_charges_idが空では出品できない' do
        @item.shipping_charges_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charges can't be blank")
      end
      it 'shipping_charges_idが1では出品できない' do
        @item.shipping_charges_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charges can't be blank")
      end
      it 'days_to_ship_idが空では出品できない' do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end
      it 'days_to_ship_idが1では出品できない' do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end
      it 'delivery_idが空では出品できない' do
        @item.delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery can't be blank")
      end
      it 'delivery_idが1では出品できない' do
        @item.delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery can't be blank")
      end
      it 'shipping_area_idが空では出品できない' do
        @item.shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'shipping_area_idが1では出品できない' do
        @item.shipping_area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceは半角数字でないと出品できない' do
        @item.price = '000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'priceは半角英数字混合では出品できない' do
        @item.price = 'abc000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'priceは半角英字では出品できない' do
        @item.price = 'abcdef'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'priceが300より少ないと出品できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'priceが9999999より多いと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
