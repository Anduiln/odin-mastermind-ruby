class GameRules
  @@code_length = 4
  @@turn_number = 10
  @@colors = ["G", "B", "Y", "P", "O", "M"]
  @@colors_full = ["Green", "Blue", "Yellow", "Purple", "Orange", "Maroon"]

  def self.code_length
    @@code_length
  end
  def self.turn_number
    @@turn_number
  end
  def self.colors
    @@colors
  end
  def self.colors_full
    @@colors_full
  end
end

