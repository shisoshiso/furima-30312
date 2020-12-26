class Item < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :title
    validates :description
    validates :category_id
    validates :item_status_id
    validates :delivery_fee_id
    validates :ship_from_area_id
    validates :days_to_delivery_id
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than: 10000000}
  end
end
