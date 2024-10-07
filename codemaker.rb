require_relative "game_rules"

class Codemaker
  attr_reader :code

  def initialize()
    @code = random_code(GameRules.code_length)
  end

  def random_code(length)
    code = ""
    length.times do
      code += GameRules.colors.sample 
    end
    return code
  end
end