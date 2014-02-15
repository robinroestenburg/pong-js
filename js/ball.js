function Ball() {
  Entity.call(this);

  this.width  = 20;
  this.height = 22;

  this.reset();
}

Ball.prototype = Object.create(Entity.prototype);
Ball.prototype.constructor = Ball;

Ball.prototype.update = function() {
  Entity.prototype.update.apply(this, arguments);

  if (this.y > game.height - this.height || this.y < 0) {
    this.yVelocity *= -1;
  }

  if (this.x > game.width) {
    game.player.score += 1;
    this.reset();
  }

  if (this.x < 0) {
    game.bot.score += 1;
    this.reset();
  }

  if (this.intersect(game.bot)) {
    var hitter = game.bot;
  } else if (this.intersect(game.player)) {
    var hitter = game.player;
  }

  if (hitter) {
    this.xVelocity *= -1.1;
    this.yVelocty *= -1.1;

    this.yVelocity += hitter.yVelocity / 2;
  }
};

Ball.prototype.reset = function() {
  this.x = game.width / 2 - this.width / 2;
  this.y = game.height / 2 - this.height / 2;

  var max = 5,
      min = -5;
  this.yVelocity = Math.floor(Math.random() * (max - min + 1) + min);
  this.xVelocity = Math.random() > 0.5 ? 5 : -5;
};
