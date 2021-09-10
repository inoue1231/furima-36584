require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規作成できる場合' do
      it '入力できていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規作成できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'myoujiが空では登録できない' do
        @user.myouji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Myouji can't be blank")
      end

      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it 'myouji_kanaが空では登録できない' do
        @user.myouji_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Myouji kana can't be blank")
      end

      it 'name_kanaが空では登録できない' do
        @user.name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana can't be blank")
      end

      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emilには＠マークが無くては登録できない' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 'a1346'
        @user.password_confirmation = 'a1246'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

       it 'emilには＠マークが無くては登録できない' do
       @user.email = 'test.com'
       @user.valid?
       expect(@user.errors.full_messages).to include('Email is invalid')
       end

       it 'passwordが5文字以下であれば登録できない' do
       @user.password = 'a1346'
       @user.password_confirmation = 'a1246'
       @user.valid?
       expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
       end

       it 'passwordとpassword_confirmationが不一致では登録できない' do
       @user.password_confirmation = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
       end

       it 'passwordが半角英数字でないと登録できない(数字のみ）' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password confirmation is invalid')
      end


       it 'passwordが半角英数字でないと登録できない(英字のみ）' do
        @user.password = 'Aaaaaa'
        @user.password_confirmation = 'Aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password confirmation is invalid')
     end

 

       it 'passwordを全角文字で入力すると登録できない' do
        @user.password = '１ｂｂｂｂｂｂ'
        @user.password_confirmation = '１ｂｂｂｂｂｂ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password confirmation is invalid')
      end

      it '苗字の入力には漢字ひらがなカタカナで入力しないと登録できない' do
        @user.myouji = 'Aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Myouji is invalid')
      end

      it '名前の入力には漢字ひらがなカタカナで入力しないと登録できない' do
        @user.name = 'Aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name is invalid')
      end

      it '苗字(カナ）の入力にはカタカナで入力しないと登録できない' do
        @user.myouji_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Myouji kana is invalid')
      end

      it '名前(カナ）の入力にはカタカナで入力しないと登録できない' do
        @user.name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name kana is invalid')
      end
    end
  end
end

