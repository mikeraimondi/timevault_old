class Task < ActiveRecord::Base
  attr_accessible :description, :end, :name, :start

  scope :descending_start_date, order("start DESC")

  belongs_to :user, :inverse_of => :tasks
  validates_presence_of :user

  validates_presence_of :name
  validates_presence_of :start

  validates_datetime :start, :after => lambda { 30.years.ago },
                             :before_message => "date is too long ago"
  validates_datetime :start, :before => lambda { (DateTime.now + 30.years) },
                             :after_message => "date is too far in the future"

  validates_datetime :end, :after => lambda { 30.years.ago },
                             :before_message => "date is too long ago", allow_blank: true

  validates_datetime :end, :before => lambda { (DateTime.now + 30.years) },
                             :after_message => "date is too far in the future", allow_blank: true
end
