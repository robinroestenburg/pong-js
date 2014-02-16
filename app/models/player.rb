class Player < Paddle

  def initialize
    super
    @x = 20
  end

  def update
    speed = 15;

    if @game.key_pressed[:up]
      @y_velocity = -speed;
    elsif @game.key_pressed[:down]
      @y_velocity = speed;
    else
      @y_velocity = 0;
    end

    super
  end

end
