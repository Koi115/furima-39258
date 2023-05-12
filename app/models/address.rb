class Address < ApplicationRecord

  #--- association ---#
  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  

end
