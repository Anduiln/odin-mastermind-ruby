require_relative "game_rules"
require_relative "code_makeable"
require_relative "checkable"

class Codebreaker
  include Code_Makeable
  include Checkable

  attr_accessor :guess, :results

  def initialize()
    @results = Array.new(GameRules.code_length, nil)
    @guess = ""
  end

  def play_turn(player_role, code)
    if player_role == "breaker"
      @guess = make_code()
    elsif player_role == "maker"
      @guess = random_code(GameRules.code_length)
    end

    check_guess(code)
    puts "..."
    puts "#{results.count{|r| r == "red"}} exactly right, #{results.count{|r| r == "white"}} correct color only."
  end
end