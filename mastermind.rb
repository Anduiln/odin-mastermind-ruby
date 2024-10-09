require_relative "game_rules"
require_relative "codemaker"
require_relative "codebreaker"

puts "This is a game of Mastermind in #{GameRules.turn_number} turns."
puts "The code is of length #{GameRules.code_length}, among the following colors: #{GameRules.colors_full.join(", ")}." 
puts "Duplicates are allowed."
puts

# Change rules
puts "Are these rules OK? y/n"
answer = ""
until answer == "y" || answer == "n"
  answer = gets.chomp[0].downcase
end

until answer == "y"
  puts "How many turns should the game last? (max 42)"
  entry = 0
  until entry > 0 && entry <= 42
    entry = gets.chomp.to_i
  end
  GameRules.turn_number = entry

  puts "How long should the code be? (max 6)"
  entry = 0
  until entry > 0 && entry <= 6
    entry = gets.chomp.to_i
  end
  GameRules.code_length = entry

  puts "What should the allowed colors be? (as comma-separated list, no colors with same first letter, no more than 8)"
  loop do 
    entry = ["!"]
    until entry.all? { |c| c.match?(/^[A-Za-z]+$/)} && entry.empty? == false && entry.size <=8
      entry = gets.chomp.split(",")
      entry.map! {|e| e.strip.capitalize}
    end
    GameRules.colors_full = entry
    break if GameRules.colors == GameRules.colors.uniq
  end

  puts
  puts "This is a game of Mastermind in #{GameRules.turn_number} turns."
  puts "The code is of length #{GameRules.code_length}, among the following colors: #{GameRules.colors_full.join(", ")}." 
  puts "Duplicates are allowed."
  puts
  puts "Are these rules OK? y/n"
  answer = ""
  until answer == "y" || answer == "n"
    answer = gets.chomp[0].downcase
  end
end

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
breaker = Codebreaker.new(player)
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
