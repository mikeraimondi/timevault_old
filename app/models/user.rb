class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

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

  def timer_running?
    self.pomodoros.each do |pomodoro|
      return true if pomodoro.running? && !pomodoro.new_record?
    end
    false
  end

end
