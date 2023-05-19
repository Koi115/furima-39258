require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    #--------- 正常系 ----------
    context '新規登録できる場合' do
      it 'nickname、email、passwordとpassword_confirmation、name_last、name_first、name_last_kana、name_first_kana、birth_date が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    #--------- 異常系 ----------
    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '12345abc'
        @user.password_confirmation = '12345def'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it 'passwordが数字だけでは登録できない' do
        @user.password = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
      end

      it 'passwordが英字だけでは登録できない' do
        @user.password = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
      end

      it 'passwordが半角英数字でないと（全角文字だと）登録できない' do
        @user.password = '１２３a４５６'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
      end

      it 'name_lastが空では登録できない' do
        @user.name_last = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字を入力してください')
      end

      it 'name_lastが半角英数字では登録できない' do
        @user.name_last = '3A'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字全角文字を使用してください')
      end

      it 'name_firstが空では登録できない' do
        @user.name_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前を入力してください')
      end

      it 'name_firstが半角英数字では登録できない' do
        @user.name_first = '3A'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前全角文字を使用してください')
      end

      it 'name_last_kanaが空では登録できない' do
        @user.name_last_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字(カナ)を入力してください')
      end

      it 'name_last_kanaが漢字では登録できない' do
        @user.name_last_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字(カナ)全角カタカナ文字を使用してください')
      end

      it 'name_first_kanaが空では登録できない' do
        @user.name_first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前(カナ)を入力してください')
      end

      it 'name_first_kanaが漢字では登録できない' do
        @user.name_first_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前(カナ)全角カタカナ文字を使用してください')
      end

      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
