class ItemOrder
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number, :user_id,
                :item_id

  with_options presence: true do
    validates :token, :municipality, :address
    validates :shipping_area_id, numericality: { other_than: 1, message: 'を入力してください' }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は半角で入力してください (例 123-4567)' }
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'が不正確です' }
    validates :user_id
    validates :item_id
  end
  validates :phone_number, numericality: { only_integer: true, message: 'は半角数値で入力してください' }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipality: municipality, address: address,
                   building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
