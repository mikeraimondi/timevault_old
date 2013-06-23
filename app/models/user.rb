class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many  :tasks,
            inverse_of: :user, 
            dependent: :destroy

  has_many  :pomodoros,
            inverse_of: :user,
            dependent: :destroy

  has_many  :intervals,
            inverse_of: :user,
            through: :pomodoros,
            readonly: true

  has_many  :repositories,
            inverse_of: :user,
            dependent: :destroy

  has_many  :commits,
            through: :repositories,
            inverse_of: :user,
            readonly: true

  validates_presence_of :role

  ROLES = %w[user admin]

  validates_inclusion_of :role, in: ROLES

  attr_accessible :email, :password, :password_confirmation, :remember_me

  def timer_running?
    self.pomodoros.find_each do |pomodoro|
      return true if pomodoro.running? && !pomodoro.new_record?
    end
    false
  end

  def admin?
    role == "admin"
  end

end
