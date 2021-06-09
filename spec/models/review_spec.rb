require 'rails_helper'

RSpec.describe Review, type: :model do
  before do
    @review = FactoryBot.build(:review)
  end

  describe '宿泊施設レビュー' do
    context '宿泊施設レビューができるとき' do
      it 'total_scoreとcommentが存在すればレビューできる' do
        expect(@review).to be_valid
      end
      it 'commentは空でもレビューできる' do
        @review.comment = ' '
        expect(@review).to be_valid
      end
    end

    context '宿泊施設レビューできないとき' do
      it 'total_scoreが空ではレビューできない' do
        @review.total_score = ' '
        @review.valid?
        expect(@review.errors.full_messages).to include("Total score can't be blank")
      end
      it 'hotelが紐付いていないと保存できないこと' do
        @review.hotel = nil
        @review.valid?
        expect(@review.errors.full_messages).to include('Hotel must exist')
      end
      it 'userが紐付いていないと保存できないこと' do
        @review.user = nil
        @review.valid?
        expect(@review.errors.full_messages).to include('User must exist')
      end
    end
  end
end
