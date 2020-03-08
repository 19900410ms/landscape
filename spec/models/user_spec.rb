require 'rails_helper'

describe User do

  describe '#create' do

    #ニックネーム、メールアドレス、passwordとpassword_confirmationが存在すれば登録できること
    it "is valid with a nickname, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end

    #ニックネームが空白では登録不可
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    #メールアドレスが空白では登録不可
    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    #重複したメールアドレスは登録不可
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    #passwordが入力済みでもpassword_confirmationが空白では登録不可
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    #passwordが入力済みでもpassword_confirmationが一致しなければ登録不可
    it "is invalid if password_confirmation does not match even if password has been entered" do
      user = build(:user, password_confirmation: "654321")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

  end

end