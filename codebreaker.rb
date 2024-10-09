require_relative "game_rules"
require_relative "createable"
require_relative "checkable"
require_relative "breakable"

class Codebreaker
  include Createable
  include Checkable
  include Breakable

  attr_accessor :guess, :results, :possibilities

  def initialize(player_role)
    @results = Array.new(GameRules.code_length, nil)
    @guess = ""
    if player_role == "maker"
      # Create array of all possible color codes, as strings
      @possibilities = GameRules.colors.repeated_permutation(GameRules.code_length).to_a.map {|code| code.join}
    end
  end

  def play_turn(player_role, code)
    if player_role == "breaker"
      @guess = make_code()
      @results = check_guess(code)
    elsif player_role == "maker"
      @guess = break_code()
      @results = check_guess(code)
      update_possibilities() unless @results.all? {|r| r == "red"}
    end
    
    puts "..."
    puts "#{results.count{|r| r == "red"}} exactly right, #{results.count{|r| r == "white"}} correct color only."
  end
end