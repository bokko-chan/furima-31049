class Item < ApplicationRecord
  extend ActiveHash::Associatons::ActiveRecordExtensions
  belongs_to :user, :category, :status, :carriage, :area, :send
  with_options presence: ture do
    validates :title, :explain
    validates :price, format: { /\A[0-9]+\z/ }
  end
  validates :category_id, :status_id, :carriage_id, :area_id, :send_id, numericality: { other_than: 1 }
end
