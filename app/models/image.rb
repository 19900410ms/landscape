class Image < ApplicationRecord
  belongs_to :spot, optional: true
  # validates :image, presence: :true

  mount_uploader :image, ImageUploader
end