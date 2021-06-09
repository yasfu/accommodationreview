require 'rails_helper'

RSpec.describe Hotel, type: :model do
  before do
    @hotel = FactoryBot.build(:hotel)
  end

  describe '宿泊施設の投稿' do
    context '宿泊施設が投稿できるとき' do
      it 'name、category_id、imageが存在すれば登録できる' do
        expect(@hotel).to be_valid
      end
    end

    context '宿泊施設が投稿できないとき' do
      it 'nameが空では投稿できないこと' do
        @hotel.name = ' '
        @hotel.valid?
        expect(@hotel.errors.full_messages).to include("Name can't be blank")
      end
      it 'category_idが1の時は投稿できないこと' do
        @hotel.category_id = 1
        @hotel.valid?
        expect(@hotel.errors.full_messages).to include("Category can't be blank")
      end
      it '画像が無かったら投稿できないこと' do
        @hotel.image = nil
        @hotel.valid?
        expect(@hotel.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
