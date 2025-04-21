class Difficulty
  LEVELS = {
    1 => ['Easy', 10],
    2 => ['Medium', 5],
    3 => ['Hard', 3]
  }.freeze

  attr_reader :level, :chances

  def initialize(choice)
    level_info = LEVELS[choice]
    raise 'Invalid difficulty level' unless level_info

    @level = level_info[0]
    @chances = level_info[1]
  end
end
