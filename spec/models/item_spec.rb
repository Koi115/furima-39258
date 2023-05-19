require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'item 新規登録' do
    #--------- 正常系 ----------
    context '新規登録できる場合' do
      it 'ログインして、name、description、category_id、status_id、fee_id、prefecture_id、period_id、price が正しく存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    #--------- 異常系 ----------
    context '新規登録できない場合' do
      it 'name が空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it 'description が空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品説明を入力してください")
      end

      it 'category_id が1(空)であれば登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品カテゴリーを入力してください")
      end

      it 'status_id が1(空)であれば登録できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end

      it 'fee_id が1(空)であれば登録できない' do
        @item.fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end

      it 'prefecture_id が1(空)であれば登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("配送元の地域を入力してください")
      end

      it 'period_id が1(空)であれば登録できない' do
        @item.period_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end

      it 'priceが空であれば登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('価格を入力してください')
      end

      it 'priceが半角数値以外(全角)であれば登録できない' do
        @item.price = '９９９'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end

      it 'priceが300より小さければ登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300以上の値にしてください')
      end

      it 'price が9,999,999 より大きければ登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は9999999以下の値にしてください')
      end

      it 'Image が空であれば登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end

      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
