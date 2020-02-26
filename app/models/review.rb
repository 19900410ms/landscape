class Review < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  validates :text, presence: :true
end
