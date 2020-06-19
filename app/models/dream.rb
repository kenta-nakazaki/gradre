class Dream < ApplicationRecord
  
  validates :content, presence: true, length: { maximum: 255 }
  validates :priority, presence: true, length: { maximum:25 }
  validates :deadline, presence: true, length: { maximum:25 }
  validates :category, length: { maximum: 50}
  validates :status, presence: true, length: { maximum:50 }
  
  belongs_to :user
  has_many :comments, dependent: :destroy
  
end
