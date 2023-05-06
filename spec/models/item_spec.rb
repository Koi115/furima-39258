require 'rails_helper'

RSpec.describe Item, type: :model do
  # before do
  #   @user = FactoryBot.build(:user)
  # end

  before do
    @item = FactoryBot.build(:item)
  end

  describe 'item 新規登録' do
    #--------- 正常系 ----------
    context '新規登録できる場合' do
      it "ログインして、name、description、category_id、status_id、fee_id、prefecture_id、period_id、price が正しく存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end    

    #--------- 異常系 ----------
    context '新規登録できない場合' do
      it "name が空では登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "description が空では登録できない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it "category_id が1(空)であれば登録できない" do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "status_id が1(空)であれば登録できない" do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it "fee_id が1(空)であれば登録できない" do
        @item.fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank")
      end

      it "prefecture_id が1(空)であれば登録できない" do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "period_id が1(空)であれば登録できない" do
        @item.period_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Period can't be blank")
      end

      it "Image が空であれば登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end


    end

  end
end
