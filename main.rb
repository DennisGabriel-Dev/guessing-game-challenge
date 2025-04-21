Dir["#{__dir__}/models/*.rb"].each { |file| require_relative file }

# Start the game
Game.new
