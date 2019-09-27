class Task < ApplicationRecord
  belongs_to :user

  # 「詳細/task_title」が最低1文字、最高20文字まで入力可
  validates :task_title, length: { minimum: 4, maximum: 20 }, presence: true
  validates :task_details, length: { minimum: 6, maximum: 100 }, presence: true

  # validates :task_title, presence: true, length: { maximum: 20 }
  # validates :task_details, presence: true, length: { maximum: 100 }
end

