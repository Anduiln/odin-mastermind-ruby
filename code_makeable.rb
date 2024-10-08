module Code_Makeable
  def make_code()
    code = ""
    until code.length == 4 && valid_colors?(code)
      code = gets.chomp.upcase
    end
    return code
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