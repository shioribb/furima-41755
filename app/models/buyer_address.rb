class BuyerAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number, :user_id, :item_id, :buyer_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :buyer_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は「3桁-4桁」の半角数字で入力してください"}
    validates :city
    validates :house_number
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: "は10桁以上11桁以内の半角数字で入力してください" }
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "都道府県を選択してください"}
  
  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, telephone_number: telephone_number, buyer_id: buyer_id)
  end
end