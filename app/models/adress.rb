class Adress < ApplicationRecord
  
  with_options presence: true do
    validates :prefectures_id, :municipality, :street
    validates :postal, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :phone,  format: { with: /\A\d{11}\z/ }
  end

end
