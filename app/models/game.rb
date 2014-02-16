require 'browser/interval'

class Game

  KEYS = {
    '32' => :space,
    '37' => :left,
    '38' => :up,
    '39' => :right,
    '40' => :down,
  }

  attr_accessor :entities, :ball, :player, :bot
  attr_reader :canvas, :width, :height, :context, :key_pressed

  def initialize(canvas)
    @canvas  = canvas
    @context = `#{canvas}[0].getContext('2d');`
    @width   = canvas.width
    @height  = canvas.height

    # Keep track of key states
    # Eg.:
    #   game.keyPressed.up === true // while UP is pressed
    #   game.keyPressed.up === false // while UP is released
    @key_pressed = {}

    Element[canvas].on('keydown keyup') do |event|
      # Convert key code to key name
      key_name = KEYS[event.which];

      if key_name
        # eg.: `self.keyPressed.up = true` on keydown
        # Will be set to `false` on keyup
        @key_pressed[key_name] = event.type == 'keydown'
        event.prevent_default
      end
    end
  end

  def start
    fps = 60
    interval = 1 / 60.0

    every(interval) do
      update
      draw
    end
  end

  def update
    entities.each do |entity|
      entity.update if entity.respond_to?(:update)
    end
  end

  def draw
    entities.each do |entity|
      entity.draw(@context) if entity.respond_to?(:draw)
    end
  end

end
