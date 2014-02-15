function Bot() {
  Paddle.call(this);

  this.x = game.width - this.width - 20;
}

Bot.prototype = Object.create(Paddle.prototype);
Bot.prototype.constructor = Bot;

Bot.prototype.update = function() {
  var speed = 5;

  if (this.y < game.ball.y - this.height) {
    this.yVelocity = speed;
  } else if (this.y > game.ball.y) {
    this.yVelocity = -speed;
  }

  Paddle.prototype.update.apply(this, arguments);
};
