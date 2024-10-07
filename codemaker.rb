require_relative "game_rules"

class Codemaker
  def initialize()
    @code = random_code(Game_Rules.code_length)
  end

  def random_code(length)
    code = ""
    length.times do
      code += Game_Rules.colors.sample 
    end
    return code
  end
end