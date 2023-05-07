class Item < ApplicationRecord

#--- association --#
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :period


#--- validate --#
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  
  #--- ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :fee_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :period_id, numericality: { other_than: 1 , message: "can't be blank"}

#--- validate for ActiveStorage --#
  validates :image, presence: true


end
