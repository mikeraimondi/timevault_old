class Commit < ActiveRecord::Base
  attr_accessible :repository_id, :sha1

  has_many  :tasks,
            through: :task_commits,
            inverse_of: :commits

  belongs_to  :repository,
              inverse_of: :commits
  validates_presence_of :repository

  accepts_nested_attributes_for :repository

  validates_presence_of :sha1
  validates_length_of :sha1, is: 40

end
