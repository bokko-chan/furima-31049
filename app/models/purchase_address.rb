class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal, :prefecture_id, :municipality, :street, :building, :phone

  with_options presence: true do
    validates :prefecture_id, :municipality, :street
    validates :postal, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :phone,  format: { with: /\A\d{11}\z/ }
  end

  def save
    Address.create(postal: postal, prefecture_id: prefecture_id, municipality: municipality, building: building, phone: phone)
    Purchase.create(user_id: user.id, item_id: item.id)
  end

end
