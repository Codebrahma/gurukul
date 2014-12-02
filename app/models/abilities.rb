module Abilities
  def self.ability_for(user)
    user ||= User.new
    UserAbility.new(user)
  end
end

class UserAbility
  include CanCan::Ability

  def initialize(user)

  end
end
