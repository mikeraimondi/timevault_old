class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    if user.admin?
        can :manage, :all
        can :access, :rails_admin
        can :dashboard
    end

  end
end
