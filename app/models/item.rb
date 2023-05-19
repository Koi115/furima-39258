class Item < ApplicationRecord
  #--- association --#
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :period

  #--- validate --#
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  #--- ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :status_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :fee_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :prefecture_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :period_id, numericality: { other_than: 1, message: "を入力してください" }

  #--- validate for ActiveStorage --#
  validates :image, presence: true
end
