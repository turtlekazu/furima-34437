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
    end

    context '失敗する場合' do
      it 'postal_codeが空のために購入失敗' do
        @order_shipping.postal_code = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code can't be blank", "Postal code Input correctly")
      end
      it 'postal_codeが全角文字のために購入失敗' do
        @order_shipping.postal_code = 'あいうえお'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code Input correctly")
      end
      it 'postal_codeが半角英語のために購入失敗' do
        @order_shipping.postal_code = 'hoge'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code Input correctly")
      end
      it 'postal_codeにハイフンがないために購入失敗' do
        @order_shipping.postal_code = '0123456'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code Input correctly")
      end
      it 'prefecture_idが1のために購入失敗' do
        @order_shipping.prefecture_id = 1
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Prefecture Select")
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
        expect(@order_shipping.errors.full_messages).to include("Phone number can't be blank", "Phone number Input only number")
      end
      it 'phone_numberが全角文字のために購入失敗' do
        @order_shipping.phone_number = 'あいうえお'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number Input only number")
      end
      it 'phone_numberが半角英語のために購入失敗' do
        @order_shipping.phone_number = 'hoge'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number Input only number")
      end
    end
  end
end
