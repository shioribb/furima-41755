require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の保存' do
    context '商品が投稿できる場合' do
      it '全て揃っていると投稿できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が投稿できない場合' do
      it '商品名が空では投稿できない' do
        @item.name = ''
        @item.valid?
       expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '画像が空では投稿できない' do
        @item.image = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品の説明が空では投稿できない' do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーが空では投稿できない' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category 選択してください")
      end

      it '商品の状態が空では投稿できない' do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank", "Status 選択してください")
         
      end
      it '配送料の負担の情報が空では投稿できない' do
        @item.postage_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank", "Postage 選択してください")
      end

      it '発送元の地域の情報が空では投稿できない' do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank", "Prefecture 選択してください")
      end

      it '発送までの日数の情報が空では投稿できない' do
        @item.shopping_date_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping date can't be blank", "Shopping date 選択してください")
      end

      it '価格の情報が空では投稿できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is valid")
      end

      it '価格が全角数値の場合、保存できない' do
        @item.price = '１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is valid")
      end

      it '価格が価格が数値以外の文字を含む場合、保存できない' do
        @item.price = 'aaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is valid")
      end

      it '価格が300未満では保存できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is valid")
      end

      it '価格が9,999,999より大きいと保存できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is valid")
      end
    end
  end
end
