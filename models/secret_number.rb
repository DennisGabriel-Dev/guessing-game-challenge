class SecretNumber
  def initialize
    @value = rand(1..100)
  end

  def compare_to(guess)
    return :correct if guess == @value
    guess > @value ? :too_high : :too_low
  end


  def reveal
    @value
  end
end
