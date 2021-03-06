class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :order
  has_one_attached :image
  belongs_to :area
  belongs_to :classone
  belongs_to :storage
  belongs_to :shipping_charges
  belongs_to :days_to_ship
  belongs_to :delivery
  belongs_to :shipping_area

  with_options presence: true do
    validates :title,
              :text,
              :image,
              :weight,
              :catch_day,
              :tighten,
              :process,
              :process_timing

    with_options numericality: { other_than: 1, message: 'を入力してください' } do
      validates :area_id,
                :classone_id,
                :storage_id,
                :shipping_charges_id,
                :days_to_ship_id,
                :delivery_id,
                :shipping_area_id
    end

    with_options numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                                 message: 'が範囲外です' } do
      validates :price, format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
    end
  end
end
