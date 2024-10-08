require_relative "game_rules"
require_relative "code_makeable"
require_relative "checkable"

class Codebreaker
  include Code_Makeable
  include Checkable

  attr_accessor :guess, :results

  def initialize(player_role)
    if player_role == :breaker
      @results = Array.new(GameRules.code_length, nil)
      @guess = ""
    else

    end
  end

  def play_turn(code)
    @guess = make_code()
    check_guess(code)
    puts "..."
    puts "The codemaker's response is : #{results.count{|r| r == "red"}} exactly right, #{results.count{|r| r == "white"}} correct color only."
  end
end