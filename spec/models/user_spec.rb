require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)

  end


  describe 'ユーザー新規登録' do
#--------- 正常系 ----------
    context '新規登録できる場合' do
      it "nickname、email、passwordとpassword_confirmation、name_last、name_first、name_last_kana、name_first_kana、birth_date が存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

#--------- 異常系 ----------
    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '12345abc'
        @user.password_confirmation = '12345def'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが数字だけでは登録できない' do
        @user.password = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it 'passwordが英字だけでは登録できない' do
        @user.password = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it 'passwordが半角英数字でないと（全角文字だと）登録できない' do
        @user.password = '１２３a４５６'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it "name_lastが空では登録できない" do
        @user.name_last = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name last 全角文字を使用してください")
      end

      it "name_lastが半角英数字では登録できない" do
        @user.name_last = '3A'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name last 全角文字を使用してください")
      end

      it "name_firstが空では登録できない" do
        @user.name_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first 全角文字を使用してください")
      end

      it "name_firstが半角英数字では登録できない" do
        @user.name_first = '3A'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first 全角文字を使用してください")
      end

      it "name_last_kanaが空では登録できない" do
        @user.name_last_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name last kana 全角カタカナ文字を使用してください")
      end

      it "name_last_kanaが漢字では登録できない" do
        @user.name_last_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name last kana 全角カタカナ文字を使用してください")
      end

      it "name_first_kanaが空では登録できない" do
        @user.name_first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first kana 全角カタカナ文字を使用してください")
      end

      it "name_first_kanaが漢字では登録できない" do
        @user.name_first_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first kana 全角カタカナ文字を使用してください")
      end

      it "birth_dateが空では登録できない" do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end

    end

  end

end
