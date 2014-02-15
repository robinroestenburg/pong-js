function Player() {
  Paddle.call(this);

  this.x = 20;
}

Player.prototype = Object.create(Paddle.prototype);
Player.prototype.constructor = Player;

Player.prototype.update = function() {
  var speed = 15;

  if (game.keyPressed.up) {
    this.yVelocity = -speed;
  } else if (game.keyPressed.down) {
    this.yVelocity = speed;
  } else {
    this.yVelocity = 0;
  }

  Paddle.prototype.update.apply(this, arguments);
};
