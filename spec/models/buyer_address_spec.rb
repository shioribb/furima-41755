require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @buyer_address = FactoryBot.build(:buyer_address, user_id: @user.id, item_id: @item.id)
    sleep(0.1)
  end
  
  describe '商品購入情報の保存' do

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buyer_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @buyer_address.building_name = ''
        expect(@buyer_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @buyer_address.postal_code = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buyer_address.postal_code = '1234567'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @buyer_address.prefecture_id = '1'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @buyer_address.city = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
        @buyer_address.house_number = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'telephone_numberが空だと保存できないこと' do
        @buyer_address.telephone_number = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが9桁以下だと保存できないこと' do
        @buyer_address.telephone_number = '111111111'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Telephone number is invalid. Input only number", "Telephone number is too short (minimum is 10 characters)")
      end
      it 'telephone_numberが12桁以上だと保存できないこと' do
        @buyer_address.telephone_number = '111111111111'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Telephone number is invalid. Input only number", "Telephone number is too long (maximum is 11 characters)")
      end
      it 'telephone_numberが半角数値でないと保存できないこと' do
        @buyer_address.telephone_number = '１１１１１１１１１１'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Telephone number is invalid. Input only number")
      end
      it 'user_idが空だと保存できないこと' do
        @buyer_address.user_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できないこと' do
        @buyer_address.item_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
