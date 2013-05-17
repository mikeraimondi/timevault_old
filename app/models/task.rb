class Task < ActiveRecord::Base
  attr_accessible :description, :end, :name, :start

  belongs_to :user

  validates_presence_of :name
  validates_presence_of :start

  validates_datetime :start, :before => lambda { 30.years.ago },
                             :before_message => "date is too long ago"
  validates_datetime :start, :after => lambda { (DateTime.now + 30.years) },
                             :after_message => "date is too far in the future"

  validates_datetime :end, :before => lambda { 30.years.ago },
                             :before_message => "date is too long ago"
  validates_datetime :end, :after => lambda { (DateTime.now + 30.years) },
                             :after_message => "date is too far in the future"
end
