class Task < ActiveRecord::Base
  attr_accessible :description, :end, :name, :start

  belongs_to :user
end
