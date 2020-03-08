require 'rails_helper'

describe Profile do

  describe '#create' do

    #アイコンが空白でも登録可能
    it "is valid without a icon" do
      profile = build(:profile, icon: nil)
      expect(profile).to be_valid
    end

    #国籍が空白では登録不可
    it "is invalid without a citizenship" do
     profile = build(:profile, citizenship: nil)
     profile.valid?
     expect(profile.errors[:citizenship]).to include("can't be blank")
    end

    #性別が空白では登録不可
    it "is invalid without a gender" do
      profile = build(:profile, gender: nil)
      profile.valid?
      expect(profile.errors[:gender]).to include("can't be blank")
    end

    #年齢が空白では登録不可
    it "is invalid without a age" do
      profile = build(:profile, age: nil)
      profile.valid?
      expect(profile.errors[:age]).to include("can't be blank")
    end

    #外部キー(user)がなければ記事は無効。
    it "is invalid without user_id" do
      profile = build(:profile, user_id: nil)
      profile.valid?
      expect(profile.errors[:user_id]).to include("can't be blank")
    end

  end

end