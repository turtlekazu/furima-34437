require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '成功する場合' do
      it '全ての要素が揃っており、登録成功' do
        expect(@item).to be_valid
      end
    end
    context '失敗する場合' do
      it 'nameが空のため登録失敗' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'infoが空のため登録' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'category_idが未選択のため登録失敗' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it 'sales_status_idが未選択のため商品登録に失敗する' do
        @item.sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Sales status Select')
      end
      it 'shipping_fee_idが未選択のため登録失敗' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee Select')
      end
      it 'prefecture_idが未選択のため登録失敗' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture Select')
      end
      it 'scheduled_delivery_idが未選択のため登録失敗' do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Scheduled delivery Select')
      end
      it 'priceが空のため登録失敗' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price Half-width number',
                                                      'Price Out of setting range')
      end
      it 'priceが全角文字のため登録失敗' do
        @item.price = 'あいう'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number', 'Price Out of setting range')
      end
      it 'priceが全角数字のため登録失敗' do
        @item.price = '１２３４５６'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number', 'Price Out of setting range')
      end
      it 'priceが半角英語のため登録失敗' do
        @item.price = 'hogefuga'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number', 'Price Out of setting range')
      end
      it 'priceが300未満のため登録失敗' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceが9,999,999より大きいため登録失敗' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'imageが空のため登録失敗' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'userが空のため登録失敗' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
