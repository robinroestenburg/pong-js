class Paddle < Entity

  attr_accessor :score

  def initialize
    super

    @width = 20
    @height = 100

    @y = @game.height / 2 - @height / 2

    @score = 0
  end

  def update
    super

    @y = [[@y, 0].max, @game.height - @height].min
  end

end
