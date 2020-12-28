class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :delivery_fee
  belongs_to :ship_from_area
  belongs_to :days_to_delivery

  with_options presence: true do
    validates :title
    validates :description
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than: 10_000_000 }
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :item_status_id
    validates :delivery_fee_id
    validates :ship_from_area_id
    validates :days_to_delivery_id
  end
end
