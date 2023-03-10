class Ability
  include CanCan::Ability

  def initialize(user)
    case user.role
    when 'user'
      can %i[read create], Post
      can %i[update destroy], Post, author_id: user.id
      can %i[read create], Comment
      can %i[update destroy], Comment, author_id: user.id
    when 'admin'
      can :manage, :all
    else
      can :read, Post
    end
  end
end
