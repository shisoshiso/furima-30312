class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :title, unless: :was_attached?
    validates :description
    validates :category_id
    validates :item_status_id
    validates :delivery_fee_id
    validates :ship_from_area_id
    validates :days_to_delivery_id
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than: 10000000}
  end

  def was_attached?
    self.image.attached?
  end
end
