require_relative "game_rules"
require_relative "guessable"
require_relative "checkable"

class Codebreaker
  include Guessable
  include Checkable

  attr_accessor :guess, :results

  def initialize()
    @results = Array.new(GameRules.code_length, nil)
    @guess = ""
  end

  def play_turn(code)
    make_guess()
    check_guess(code)
    puts "..."
    puts "The codemaker's response is #{results.compact.join(", ")}."
  end
end