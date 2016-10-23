class Task < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :user_id, presence: true
  validates :completion_status, presence: true

end
