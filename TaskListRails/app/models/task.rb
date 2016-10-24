class Task < ActiveRecord::Base
  belongs_to :user

  validates :name, :user_id, :completion_status, presence: true
end
