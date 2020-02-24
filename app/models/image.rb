class Image < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  validates :image, presence: :true
end