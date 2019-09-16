class Task < ApplicationRecord
  belongs_to :user
  
  validates :task_title, presence: true, length: { maximum: 20 }
  validates :task_details, presence: true, length: { maximum: 100 }
end

