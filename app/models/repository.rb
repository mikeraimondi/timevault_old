class Repository < ActiveRecord::Base
  attr_accessible :name, :url

  validates_presence_of :name
  validates_presence_of :url

  has_many  :commits,
            dependent: :destroy,
            inverse_of: :repository

  belongs_to  :user,
              inverse_of: :repositories
end
