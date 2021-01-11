class BuyLogAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipalities, :house_number, :tel_number, :building, :buy_log_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipalities
    validates :house_number
    validates :tel_number, format: { with: /\A\d{11}\z/, message: 'is invalid. Input only number' }
    validates :user_id  # user_id,item_idが空になるケースは珍しいが,予期せぬエラーを予防
    validates :item_id
    validates :token  # クレジットカード情報に不備があると購入記録が保存されない様にする
  end

  def save
    buy_log = BuyLog.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, house_number: house_number, tel_number: tel_number, building: building, buy_log_id: buy_log.id)
  end
end
