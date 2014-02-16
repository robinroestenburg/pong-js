class Ball < Entity

  def initialize
    super

    @width = 20
    @height = 22

    reset
  end

  def reset
    @x = @game.width / 2 - @width / 2
    @y = @game.height / 2 - @height / 2

    max = 5
    min = -5

    @y_velocity = (rand * (max - min + 1) + min).floor
    @x_velocity = rand > 0.5 ? 5 : -5
  end

  def update
    super

    if (@y > @game.height - @height || y < 0)
      @y_velocity *= -1
    end

    if @x > @game.width
      @game.player.score += 1
      reset
    end

    if @x < 0
      @game.bot.score += 1
      reset
    end

    if intersect(@game.bot)
      hitter = @game.bot
    elsif intersect(@game.player)
      hitter = @game.player
    end

    if hitter
      @x_velocity *= -1.1
      @y_velocty *= -1.1

      @y_velocity += hitter.y_velocity / 2
    end
  end

end
