class Repository < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :name

  has_many  :commits,
            dependent: :destroy,
            inverse_of: :repository
end
