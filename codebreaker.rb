require_relative "game_rules"
require_relative "guessable"

class Codebreaker
  include Guessable
  include Checkable

  def initialize()
    @results = Array.new(Game_Rules.code_length, nil)
    @guess = ""
  end

end