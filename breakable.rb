# will need GameRules, Checkable

module Breakable
  def break_code()
    # if first try, test code main of two first colours
    if self.results == [nil, nil, nil, nil]
      first_try = GameRules.colors[1] * GameRules.code_length
      first_try[0..1] = GameRules.colors[0] * 2
      if self.possibilities.include?(first_try)
        return first_try
      else
        return self.possibilities[0]
      end
    else
      return self.possibilities[0]
    end
  end

  def update_possibilities()
    self.possibilities.filter! {|p| self.results == check_guess(p)}
  end
end