require_relative "game_rules"
require_relative "code_makeable"

class Codemaker
  include Code_Makeable

  attr_reader :code

  def initialize(player_role)
    if player_role == "breaker"
      @code = random_code(GameRules.code_length)
    elsif player_role == "maker"
      @code = make_code()
    end
  end
end