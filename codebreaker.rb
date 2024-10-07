require_relative "game_rules"

class Codebreaker
  def initialize()
    @results = Array.new(Game_Rules.code_length, nil)
    @guess = ""
  end

  def make_guess()
    #get player guess, make sure it has the right length and content
    #store in @guess
  end

  def check_guess()
    #for each character in guess
      #if exactly equal corresponding character in code, make corresponding result red
      #else loop over code
        #if any equal to any character in code, make corresponding result white
        #else make corresponding result nil
    #order results alphabetically
  end
end