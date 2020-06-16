class Dream < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  validates :priority, presence: true, length: { maximum:25 }
  validates :deadline, presence: true, length: { maximum:25 }
  validates :category, length: { maximum: 50}
  validates :status, presence: true, length: { maximum:50 }
end
