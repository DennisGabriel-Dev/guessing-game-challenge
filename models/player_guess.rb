

class PlayerGuess
  def initialize
    print "Enter your guess: "
    @guess = gets.chomp.to_i
  end

  def value
    @guess
  end
end
