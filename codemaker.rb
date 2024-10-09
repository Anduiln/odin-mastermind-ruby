require_relative "game_rules"
require_relative "createable"

class Codemaker
  include Createable

  attr_reader :code

  def initialize(player_role)
    if player_role == "breaker"
      @code = random_code(GameRules.code_length)
    elsif player_role == "maker"
      @code = make_code()
    end
  end
end