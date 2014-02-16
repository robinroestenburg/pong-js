class Background

  def initialize(options = {})
    @game = options.fetch(:game) { Pong.game }
  end

  def draw(context)
    @context = `#{@game.canvas}[0].getContext('2d');`
    `#{@context}.fillStyle = '#000'`
    `#{@context}.fillRect(0, 0, self.game.width, self.game.height)`

    `#{@context}.fillStyle = '#fff'`
    `#{@context}.font = '40px monospace'`
    `#{@context}.fillText(self.game.player.score, self.game.width * 3 / 8, 50)`
    `#{@context}.fillText(self.game.bot.score, self.game.width * 5 / 8, 50)`
  end

end
