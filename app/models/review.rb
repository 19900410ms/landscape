class Review < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  validates :text, :user_id, :spot_id, presence: :true
end
