require 'opal'
require 'jquery'
require 'opal-jquery'
require 'browser'

require 'models/game'
require 'models/entity'
require 'models/ball'
require 'models/background'
require 'models/paddle'
require 'models/bot'
require 'models/player'

module Pong

  def self.game
    @game ||= Game.new(canvas)
  end

  def self.canvas
    @canvas ||= Element['canvas'].first
  end

end

Document.ready? do
  canvas = Pong.canvas
  game   = Pong.game

  game.ball   = Ball.new
  game.player = Player.new
  game.bot    = Bot.new

  game.entities = [
    Background.new,
    game.ball,
    game.player,
    game.bot,
  ]

  game.start
  canvas.focus
end
