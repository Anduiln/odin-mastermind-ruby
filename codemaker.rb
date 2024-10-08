require_relative "game_rules"

class Codemaker
  attr_reader :code

  def initialize(player_role)
    if player_role == :breaker
      @code = random_code(GameRules.code_length)
    else
      
    end
  end

  def random_code(length)
    code = ""
    length.times do
      code += GameRules.colors.sample 
    end
    return code
  end
end