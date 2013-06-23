class Commit < ActiveRecord::Base
  has_many  :task_commits,
            inverse_of: :commit
  has_many  :tasks,
            through: :task_commits,
            inverse_of: :commits,
            readonly: true
  belongs_to  :repository,
              inverse_of: :commits

  validates_presence_of :repository

  validates_presence_of :sha1
  validates_length_of :sha1, is: 40

  attr_accessible :repository_id, :sha1
end
