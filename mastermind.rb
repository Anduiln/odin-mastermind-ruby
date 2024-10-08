require_relative "game_rules"
require_relative "codemaker"
require_relative "codebreaker"

puts "This is a game of Mastermind in #{GameRules.turn_number} turns."
puts "The code is of length #{GameRules.code_length}, among the following colors: #{GameRules.colors_full.join(", ")}." 
puts "Duplicates are allowed."
puts

# Decide player role
player = ""
puts "Would you like to play as the codemaker or the codebreaker?"

until player == "breaker" || player == "maker"
  player = gets.chomp.downcase
  if player == "b" || player == "codebreaker"
    player = "breaker"
  elsif player == "m" || player == "codemaker"
    player = "maker"
  end
end

# Generate code
puts "Input your code, codemaker!" if player == "maker"
maker = Codemaker.new(player)
puts "..."

# Break code
puts "The codemaker has decided on a code. Input your guess as initials, e.g. \"YGYB\"." if player == "breaker"
breaker = Codebreaker.new
turn = 0
winner = "codebreaker"

until breaker.results.all? {|r| r == "red"}
  if turn >= GameRules.turn_number
    winner = "codemaker"
    break
  end
  breaker.play_turn(player, maker.code)
  turn += 1
end

puts "The #{winner} wins on turn #{turn}!"
