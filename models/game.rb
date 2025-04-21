class Game
  def initialize
    show_intro
    difficulty = select_difficulty
    play_round(difficulty)
  end

  private

  def show_intro
    puts <<~TEXT
      Welcome to the Number Guessing Game!
      I'm thinking of a number between 1 and 100.

      Please select the difficulty level:
      1. Easy (10 chances)
      2. Medium (5 chances)
      3. Hard (3 chances)
    TEXT
  end

  def select_difficulty
    print "Enter your choice: "
    choice = gets.chomp.to_i
    Difficulty.new(choice)
  rescue
    puts "Incorrect level selected. Please try again."
    exit
  end

  def play_round(difficulty)
    number = SecretNumber.new
    attempts_left = difficulty.chances

    puts "\nGreat! You selected #{difficulty.level} level with #{attempts_left} chances."
    puts "Let's start the game!\n\n"

    while attempts_left.positive?
      guess = PlayerGuess.new
      result = number.compare_to(guess.value)
      attempts_left -= 1

      case result
      when :correct
        puts "🎉 Congratulations! You guessed the correct number!"
        return
      when :too_high
        puts "❌ The number is less than #{guess.value}."
      when :too_low
        puts "❌ The number is greater than #{guess.value}."
      end
    end

    puts "\n😢 You've run out of attempts. The correct number was #{number.reveal}."
  end
end
