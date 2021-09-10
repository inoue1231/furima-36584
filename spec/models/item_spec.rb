require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品できる場合' do
      it '入力できていれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'profileが空では登録できない' do
        @item.profile = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Profile can't be blank")
      end

      it 'category_idが空では登録できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not included in the list')
      end

      it 'status_idが空では登録できない' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Status is not included in the list')
      end

      it 'shippingarea_idが空では登録できない' do
        @item.shippingarea_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shippingarea is not included in the list')
      end

      it 'shippingcharge_idが空では登録できない' do
        @item.shippingcharge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shippingcharge is not included in the list')
      end

      it 'daystoship_idが空では登録できない' do
        @item.daystoship_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Daystoship is not included in the list')
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'priceが半角数字でないと登録できない' do
        @item.price = '１２３４５６'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end

      it 'priceは300〜9999999の間でないと保存できない' do
        @item.price = '50'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end

      it 'priceは9999999を超えると保存できない' do
          @item.price = '99_999_999'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not included in the list')
      end

      it 'ユーザーが紐づいていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
       end

    


    end
  end
end
