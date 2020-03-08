require 'rails_helper'

describe Review do

  describe '#create' do

    #テキストが空白では登録不可
    it "is invalid without a text" do
     review = build(:review, text: nil)
     review.valid?
     expect(review.errors[:text]).to include("can't be blank")
    end

    #外部キー(user)がなければ記事は無効。
    it "is invalid without user_id" do
      review = build(:review, user_id: nil)
      review.valid?
      expect(review.errors[:user_id]).to include("can't be blank")
    end

    #外部キー(spot)がなければ記事は無効。
    it "is invalid without spot_id" do
      review = build(:review, spot_id: nil)
      review.valid?
      expect(review.errors[:spot_id]).to include("can't be blank")
    end

  end

end