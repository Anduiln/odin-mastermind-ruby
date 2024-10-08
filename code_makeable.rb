module Code_Makeable
  def make_code()
    code = ""
    until code.length == GameRules.code_length && valid_colors?(code)
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

  def random_code(length)
    code = ""
    length.times do
      code += GameRules.colors.sample 
    end
    return code
  end
end