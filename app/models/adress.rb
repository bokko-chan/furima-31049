class Adress < ApplicationRecord
  
  with_options presence: true do
    validates :prefecture_id, :municipality, :street
    validates :postal, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :phone,  format: { with: /\A\d{11}\z/ }
  end

  belongs_to :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
end
