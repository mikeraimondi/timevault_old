class Commit < ActiveRecord::Base
  attr_accessible :repository_id, :sha1

  has_many  :commits,
            through: :task_commits

  belongs_to :repository
  validates_presence_of :repository

  validates_presence_of :sha1
  validates_length_of :sha1, is: 40

end
