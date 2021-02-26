require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  describe '#create' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_shipping = FactoryBot.build(:order_shipping, user_id: user.id, item_id: item.id)
    end

    context '成功する場合' do
      it '情報が全て揃っていて購入成功' do
        expect(@order_shipping).to be_valid
      end
      it 'address_line2が空でも購入成功' do
        @order_shipping.address_line2 = ''
        expect(@order_shipping).to be_valid
      end
    end

    context '失敗する場合' do
      it 'postal_codeが空のために購入失敗' do
        @order_shipping.postal_code = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code can't be blank", 'Postal code Input correctly')
      end
      it 'postal_codeが全角文字のために購入失敗' do
        @order_shipping.postal_code = 'あいうえお'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Postal code Input correctly')
      end
      it 'postal_codeが半角英語のために購入失敗' do
        @order_shipping.postal_code = 'hoge'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Postal code Input correctly')
      end
      it 'postal_codeにハイフンがないために購入失敗' do
        @order_shipping.postal_code = '0123456'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Postal code Input correctly')
      end
      it 'prefecture_idが1のために購入失敗' do
        @order_shipping.prefecture_id = 1
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Prefecture Select')
      end
      it 'cityが空のために購入失敗' do
        @order_shipping.city = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("City can't be blank")
      end
      it 'address_line1が空のために購入失敗' do
        @order_shipping.address_line1 = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Address line1 can't be blank")
      end
      it 'phone_numberが空のために購入失敗' do
        @order_shipping.phone_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number can't be blank", 'Phone number Input only number')
      end
      it 'phone_numberが全角文字のために購入失敗' do
        @order_shipping.phone_number = 'あいうえお'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number Input only number')
      end
      it 'phone_numberが半角英語のために購入失敗' do
        @order_shipping.phone_number = 'hoge'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number Input only number')
      end
      it 'phone_numberが12文字以上のために購入失敗' do
        @order_shipping.phone_number = '012345678910'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number Input only number')
      end
      it 'tokenが空のために購入失敗' do
        @order_shipping.token = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空のために購入失敗' do
        @order_shipping.user_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空のために購入失敗' do
        @order_shipping.item_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
