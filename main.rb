puts "
  Welcome to the Number Guessing Game!
  I'm thinking of a number between 1 and 100.

  Please select the difficulty level:
  1. Easy (10 chances)
  2. Medium (5 chances)
  3. Hard (3 chances)
"
rand = rand(100)
puts
print("Enter your choice: ")
difficulty = gets.chomp.to_i || 0
levels = {1 => ['Easy', 10], 2 => ['Medium', 5], 3 => ['Hard', 3]}

attempts = levels[difficulty]
initial_chances = 0

return puts "Incorrect level selected. Please try again." if attempts.nil?


if attempts
  puts "Great! You have selected the #{attempts[0]} difficulty level."
  puts "Let's start the game!"
  attempts = attempts[1]
  initial_chances = attempts
end

while(attempts > 0) do
  print("Enter your guess: ")
  guess = gets.chomp.to_i
  attempts -= 1
  if guess != rand
    if guess > rand
      puts "Incorrect! The number is less than #{guess}."
    elsif guess < rand
      puts "Incorrect! The number is greater than #{guess}."
    end
    next
  end

  puts "Congratulations! You guessed the correct number in #{initial_chances - attempts} attempts."
  return
end

if attempts.zero?
  puts "Sorry, you have run out of attempts. The correct number was #{rand}."
end
