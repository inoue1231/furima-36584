require 'rails_helper'

RSpec.describe PurchasesAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchases_address = FactoryBot.build(:purchases_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての情報があれば登録できる' do
        expect(@purchases_address).to be_valid
      end

      it '建物名は任意である' do
        @purchases_address.building_name = ''
        expect(@purchases_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が必須である' do
        @purchases_address.postal_code = ''
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Postal code can't be blank",
                                                                   'Postal code is invalid. Include hyphen(-)')
      end

      it '郵便番号は3桁ハイフン4桁でなくては登録できない' do
        @purchases_address.postal_code = '1234567'
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it '都道府県が空では登録できない' do
        @purchases_address.shippingarea_id = 0
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Shippingarea can't be blank")
      end

      it '市区町村が空では登録できない' do
        @purchases_address.municipalities = ''
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Municipalities can't be blank")
      end

      it '番地が空では登録できない' do
        @purchases_address.address = ''
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空では登録できない' do
        @purchases_address.telephone_number = ''
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Telephone number can't be blank",
                                                                   'Telephone number is invalid.')
      end

      it '電話番号が11桁以上では登録できない' do
        @purchases_address.telephone_number = '090123456789'
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include('Telephone number is invalid.')
      end

      it '電話番号が10桁以下では登録できない' do
        @purchases_address.telephone_number = '08033344'
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include('Telephone number is invalid.')
      end


      it '電話番号は半角数字でなくては登録できない' do
        @purchases_address.telephone_number = '１１１２２２２３３３３'
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include('Telephone number is invalid.')
      end

      it 'クレジットカードの情報が空ては登録できない' do
        @purchases_address.token = nil
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'ユーザーが紐づいていないと登録できない' do
        @purchases_address.user_id = nil
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("User can't be blank")
      end

      it '商品が紐づいていないと登録できない' do
        @purchases_address.item_id = nil
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Item can't be blank")
      end




    end
  end
end
