class Ability
  include CanCan::Ability

  def initialize(user)
    # define_aliases
    user ||= User.new

    can :manage, :all
  end

  # def define_aliases
  # end

  protected

    def apply_user_rights(user)
      user_id = user.id

      can :read, [AnimationCategory, AnimationType]

      can :manage, [Animation, Website], :user_id => user_id

      can :manage, Webpage, :website => { :user_id => user_id }

      can :manage, AnimatedElement, :animation => { :user_id => user_id }

    end

end
