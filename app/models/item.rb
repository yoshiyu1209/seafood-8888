class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image
  belongs_to :area
  belongs_to :class
  belongs_to :storage
  belongs_to :shipping_charges
  belongs_to :day_to_ship
  belongs_to :delivery
  belongs_to :shipping_area
end
