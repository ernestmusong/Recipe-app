class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, [Food, Recipe]

    can :manage, [Food, Recipe], user_id: user.id

    return unless user&.admin?

    can :manage, :all
  end
end
