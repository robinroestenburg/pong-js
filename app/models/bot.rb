class Bot < Paddle

  def initialize
    super
    @x = @game.width - @width - 20
  end

  def update
    speed = 5;

    if @y < @game.ball.y - @height
      @y_velocity = speed
    elsif @y > @game.ball.y
      @y_velocity = -speed
    end

    super
  end

end
