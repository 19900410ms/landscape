class Spot < ApplicationRecord
  belongs_to :user
  validates :name,
            :image,
            :division_id,
            :prefecture_id, presence: :true
end
