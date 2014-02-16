class Entity

  attr_accessor :x, :y, :width, :height, :x_velocity, :y_velocity
  attr_reader :game

  def initialize(options = {})
    # A game entity ...

    # ... belongs to a game
    @game = options.fetch(:game) { Pong.game }

    # ... has a position
    @x, @y = 0, 0

    # ... has dimensions
    @width, @height = 0, 0

    # ... has a velocity: speed with direction
    @x_velocity, @y_velocity = 0, 0
  end

  def update
    @x += @x_velocity
    @y += @y_velocity
  end

  def draw(context)
    @context = `#{@game.canvas}[0].getContext('2d');`
    `#{@context}.fillStyle = '#fff'`
    `#{@context}.fillRect(self.x, self.y, self.width, self.height)`
  end

  # Basic bounding box collision detection.
  # Returns `true` if the entity intersect with another one.
  def intersect(other)
    return (@y + @height > other.y) &&
           (@y           < other.y + other.height) &&
           (@x + @width  > other.x) &&
           (@x           < other.x + other.width)
  end

end
