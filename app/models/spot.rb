class Spot < ApplicationRecord
  belongs_to :user
  has_many   :images, dependent: :destroy
  accepts_nested_attributes_for :images
  validates :name,
            :image,
            :division_id,
            :prefecture_id, presence: :true
  mount_uploader :image, ImageUploader
end