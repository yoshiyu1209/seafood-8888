class ItemOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number, :user_id,
                :item_id

  with_options presence: true do
    validates :municipality, :address
    validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is too short' }
    validates :user_id
    validates :item_id
  end
  validates :phone_number, numericality: { only_integer: true, message: 'is invalid. Input only number' }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipality: municipality, address: address,
                   building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
