require 'rails_helper'
RSpec.describe Item, type: :model do
  describe 'create of item' do
    before do
      @item = FactoryBot.build(:item)
    end

    context 'itemが保存できる場合' do
      it 'titleとimage,description,category_id,item_status_id,delivery_fee_id,ship_from_area_id,
          days_to_delivery_id,price,userが存在していれば保存できること' do
        expect(@item).to be_valid
      end
    end

    context 'itemが保存できない場合' do
      it 'imageが空では保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'titleが空では保存できないこと' do
        @item.title = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'descriptionが空では保存できないこと' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'categoryが空では保存できないこと' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'categoryが---では保存できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'item_statusが空では保存できないこと' do
        @item.item_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end
      it 'item_statusが---では保存できないこと' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Item status must be other than 1')
      end
      it 'delivery_feeが空では保存できないこと' do
        @item.delivery_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it 'delivery_feeが---では保存できないこと' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee must be other than 1')
      end
      it 'ship_from_areaが空では保存できないこと' do
        @item.ship_from_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship from area can't be blank")
      end
      it 'ship_from_areaが---では保存できないこと' do
        @item.ship_from_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship from area must be other than 1')
      end
      it 'days_to_deliveryが空では保存できないこと' do
        @item.days_to_delivery_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to delivery can't be blank")
      end
      it 'days_to_deliveryが---では保存できないこと' do
        @item.days_to_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to delivery must be other than 1')
      end
      it 'priceが空では保存できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが半角数字でないと保存できないこと' do
        @item.price = '２２２'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが299円以下では保存できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが10,000,000円以上では保存できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000000')
      end
      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
