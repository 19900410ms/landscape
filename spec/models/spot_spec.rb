require 'rails_helper'

describe Spot do

  describe '#create' do

    #観光地名が空白では登録不可
    it "is invalid without a name" do
     spot = build(:spot, name: nil)
     spot.valid?
     expect(spot.errors[:name]).to include("can't be blank")
    end

    #地域区分が空白では登録不可
    it "is invalid without a division_id" do
      spot = build(:spot, division_id: nil)
      spot.valid?
      expect(spot.errors[:division_id]).to include("can't be blank")
    end

    #都道府県名が空白では登録不可
    it "is invalid without a prefecture_id" do
      spot = build(:spot, prefecture_id: nil)
      spot.valid?
      expect(spot.errors[:prefecture_id]).to include("can't be blank")
    end

    #住所が空白でも登録可能
    it "is valid without a address" do
      spot = build(:spot, address: nil)
      expect(spot).to be_valid
    end

    #最寄り駅が空白でも登録可能
    it "is valid without a station" do
      spot = build(:spot, station: nil)
      expect(spot).to be_valid
    end

    #紹介文が空白でも登録可能
    it "is valid without a introduction" do
      spot = build(:spot, introduction: nil)
      expect(spot).to be_valid
    end

    #外部キー(user)がなければ記事は無効。
    it "is invalid without user_id" do
      spot = build(:review, user_id: nil)
      spot.valid?
      expect(spot.errors[:user_id]).to include("can't be blank")
    end

  end

end