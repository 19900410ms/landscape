class Profile < ApplicationRecord
  belongs_to :user, optional: true
  validates :citizenship,
            :gender,
            :age,   presence: true
  mount_uploader :image, ImageUploader
end
