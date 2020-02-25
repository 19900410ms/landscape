class Profile < ApplicationRecord
  belongs_to :user, optional: true
  validates :citizenship,
            # :icon,
            :gender,
            :age,   presence: true
  mount_uploader :icon, ImageUploader
end
