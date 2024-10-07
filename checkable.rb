module Checkable
  def check_guess(code)
    self.guess.length.times do |i|
      #character in the guess is in the same place as the code
      if self.guess[i] == code[i]
        self.results[i] = "red"
        
      #character in the guess is included elsewhere in the code
      elsif code.include?(self.guess[i])
        self.results[i] = "white"

      #character in the guess is not in code
      else
        self.results[i] = nil
      end
    end

    #sort results alphabetically, pushing nil to the end
    self.results.sort! do |n, m|
      (n ? n : "a") <=> (m ? m : "a")
    end
  end
end