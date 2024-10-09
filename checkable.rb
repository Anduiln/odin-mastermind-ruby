# will need GameRules

module Checkable
  def check_guess(code)
    response = Array.new(GameRules.code_length, nil)

    self.guess.length.times do |i|
      #character in the guess is in the same place as the code
      if self.guess[i] == code[i]
        response[i] = "red"
        
      #character in the guess is included elsewhere in the code
      elsif code.include?(self.guess[i])
        response[i] = "white"

      #character in the guess is not in code
      else
        response[i] = nil
      end
    end

    #sort results alphabetically, pushing nil to the end
    response.sort! do |n, m|
      (n ? n : "a") <=> (m ? m : "a")
    end

    return response
  end
end