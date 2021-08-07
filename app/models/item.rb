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

  with_options presence: true do
    validates :title,
              :text,
              :image,
              :tighten,
              :process,
              :process_timing

    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :ares_id,
                :class_id,
                :storage,
                :shipping_charges_id,
                :days_to_ship_id,
                :delivery_id,
                :shipping_area_id
    end

    with_options numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                                 message: 'is out of setting range' } do
      validates :price, :weight, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' }
    end

  end
end
