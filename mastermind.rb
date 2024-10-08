require_relative "game_rules"
require_relative "codemaker"
require_relative "codebreaker"

puts "This is a game of Mastermind in #{GameRules.turn_number} turns."
puts "The code is of length #{GameRules.code_length}, among the following colors: #{GameRules.colors_full.join(", ")}." 
puts "Duplicates are allowed."

player = :breaker

# Generate code
maker = Codemaker.new(player)
puts "..."
puts "The codemaker has decided on a code. Input your guess as initials, e.g. \"YGYB\"."

# Break code
breaker = Codebreaker.new(player)
turn = 0
winner = "codebreaker"

until breaker.results.all? {|r| r == "red"}
  if turn >= GameRules.turn_number
    winner = "codemaker"
    break
  end
  breaker.play_turn(maker.code)
  turn += 1
end

puts "The #{winner} wins on turn #{turn}!"
