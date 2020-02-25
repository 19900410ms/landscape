class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,
            :email, presence: :true
  validates :email, uniqueness:true
  has_one   :profile, dependent: :destroy
  has_many  :spots,   dependent: :destroy
end
