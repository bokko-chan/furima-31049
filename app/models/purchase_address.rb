class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal, :prefecture_id, :municipality, :street, :building, :phone, :token

  with_options presence: true do
    validates :prefecture_id, :municipality, :street, :token
    validates :postal, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :phone,  format: { with: /\A\d{11}\z/ }
  end

  def save
    purchase = Purchase.create!(user_id: user_id, item_id: item_id)
    Address.create!(postal: postal, prefecture_id: prefecture_id, municipality: municipality, street: street, building: building, phone: phone, id: purchase.id)
  end

end
