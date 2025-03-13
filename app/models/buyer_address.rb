class BuyerAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :city
    validates :house_number
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid. Input only number" }, length: { minimum: 10, maximum: 11, message: "is too short" }
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, telephone_number: telephone_number, buyer_id: buyer.id)
  end

end