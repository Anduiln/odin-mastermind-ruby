module Guessable
  def make_guess()
    self.guess = ""
    until self.guess.length == 4 && valid_colors?(self.guess)
      self.guess = gets.chomp.upcase
    end
  end

  def valid_colors?(string)
    string.each_char do |c|
      if GameRules.colors.include?(c) == false
        return false
      end
    end

    return true
  end
end