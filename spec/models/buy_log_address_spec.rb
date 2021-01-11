require 'rails_helper'
RSpec.describe BuyLogAddress, type: :model do
  describe 'create of buy_log_address' do
    before do
      @buy_log_address = FactoryBot.build(:buy_log_address)
    end

    context '配送先の情報が保存できる場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@buy_log_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @buy_log_address.building = nil
        expect(@buy_log_address).to be_valid
      end
    end

    context '配送先の情報が保存できない場合' do
      it 'postal_codeが空では保存できないこと' do
        @buy_log_address.postal_code = nil
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include("Postal code can't be blank", 'Postal code is invalid. Include hyphen(-)')
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buy_log_address.postal_code = '1234567'
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefectureが空では保存できないこと' do
        @buy_log_address.prefecture_id = nil
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefectureが---では保存できないこと' do
        @buy_log_address.prefecture_id = 1
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'municipalitiesが空では保存できないこと' do
        @buy_log_address.municipalities = nil
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'house_numberが空では保存できないこと' do
        @buy_log_address.house_number = nil
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'tel_numberが空では保存できないこと' do
        @buy_log_address.tel_number = nil
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include("Tel number can't be blank")
      end
      it 'tel_numberが10桁もしくは11桁の数字でないと保存できないこと' do
        @buy_log_address.tel_number = '123456789'
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include('Tel number is invalid. Input only number')
      end
      it 'tel_numberがハイフンを含むと保存できないこと' do
        @buy_log_address.tel_number = '123-4567-8910'
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include('Tel number is invalid. Input only number')
      end
      it 'tel_numberが全角数字では保存できないこと' do
        @buy_log_address.tel_number = '１２３４５６７８９１０'
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include('Tel number is invalid. Input only number')
      end
      it 'user_idが空では保存できないこと' do
        @buy_log_address.user_id = nil
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では保存できないこと' do
        @buy_log_address.item_id = nil
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @buy_log_address.token = nil
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
