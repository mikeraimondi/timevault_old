class TaskCommit < ActiveRecord::Base
  attr_accessible :commit_id, :task_id

  belongs_to :task
  validates_presence_of :task

  belongs_to :commit
  validates_presence_of :commit
end
