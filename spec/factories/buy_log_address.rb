FactoryBot.define do
  factory :buy_log_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    municipalities { '大分市北区' }
    house_number { '1-1' }
    building { '栄ビル106' }
    tel_number { '00011112222' }
    user_id { '1' }
    item_id { '1' }
  end
end
