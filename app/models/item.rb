class Item < ApplicationRecord
  with_options presence: true do
    validates :image, :title, :explain
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end
  validates :category_id, :status_id, :carriage_id, :area_id, :send_id, numericality: { other_than: 1 }

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :status, :carriage, :area, :send

end
