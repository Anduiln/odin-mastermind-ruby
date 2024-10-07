module Guessable
  def make_guess()
    until self.guess.match?(/^[A-Z]{4}$/) && valid_colors?(self.guess)
      self.guess = gets.chomp.capitalize
    end
  end

  def valid_colors?(string)
    string.each_char do |c|
      if Game_Rules.colors.include?(c) == false
        return false
      end
    end

    return true
  end
end