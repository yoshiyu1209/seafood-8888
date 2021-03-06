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
        expect(@item.errors.full_messages).to include('商品名を入力してください')
      end
      it 'textが空では出品できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の説明を入力してください')
      end
      it 'weightが空では出品できない' do
        @item.weight = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('重量を入力してください')
      end
      it 'area_idが空では出品できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('釣り場を入力してください', '釣り場を入力してください')
      end
      it 'area_idが1では出品できない' do
        @item.area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('釣り場を入力してください')
      end
      it 'catch_dayが空では出品できない' do
        @item.catch_day = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('釣り上げた日（水揚げ日）を入力してください')
      end
      it 'classone_idが空では出品できない' do
        @item.classone_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('分類を入力してください', '分類を入力してください')
      end
      it 'classone_idが1では出品できない' do
        @item.classone_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('分類を入力してください')
      end
      it 'tightenが空では出品できない' do
        @item.tighten = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('締め方を入力してください')
      end
      it 'processが空では出品できない' do
        @item.process = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('処理方法を入力してください')
      end
      it 'process_timingが空では出品できない' do
        @item.process_timing = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('締め処理を行なったタイミングを入力してください')
      end
      it 'storage_idが空では出品できない' do
        @item.storage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('保管方法を入力してください', '保管方法を入力してください')
      end
      it 'storage_idが1では出品できない' do
        @item.storage_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('保管方法を入力してください')
      end
      it 'shipping_charges_idが空では出品できない' do
        @item.shipping_charges_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を入力してください', '配送料の負担を入力してください')
      end
      it 'shipping_charges_idが1では出品できない' do
        @item.shipping_charges_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を入力してください')
      end
      it 'days_to_ship_idが空では出品できない' do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を入力してください', '発送までの日数を入力してください')
      end
      it 'days_to_ship_idが1では出品できない' do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を入力してください', '発送までの日数を入力してください')
      end
      it 'delivery_idが空では出品できない' do
        @item.delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('発送方法を入力してください', '発送方法を入力してください')
      end
      it 'delivery_idが1では出品できない' do
        @item.delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('発送方法を入力してください', '発送方法を入力してください')
      end
      it 'shipping_area_idが空では出品できない' do
        @item.shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を入力してください', '発送元の地域を入力してください')
      end
      it 'shipping_area_idが1では出品できない' do
        @item.shipping_area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を入力してください')
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('価格を入力してください', '価格が範囲外です', '価格は半角数字で入力してください')
      end
      it 'priceは半角数字でないと出品できない' do
        @item.price = '000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格が範囲外です')
      end
      it 'priceは半角英数字混合では出品できない' do
        @item.price = 'abc000'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格が範囲外です')
      end
      it 'priceは半角英字では出品できない' do
        @item.price = 'abcdef'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格が範囲外です')
      end
      it 'priceが300より少ないと出品できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('価格が範囲外です')
      end
      it 'priceが9999999より多いと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('価格が範囲外です')
      end
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('画像画像を入力してください')
      end
    end
  end
end
