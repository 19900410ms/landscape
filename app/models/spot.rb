class Spot < ApplicationRecord
  belongs_to :user
  has_many   :images,  dependent: :destroy
  has_many   :reviews, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :name,
            :division_id,
            :prefecture_id, presence: :true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :division
  belongs_to_active_hash :prefecture
end