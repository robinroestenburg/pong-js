function Paddle() {
  Entity.call(this);

  this.width  = 20;
  this.height = 100;

  this.y = game.height / 2 - this.height / 2;

  this.score = 0;
}

Paddle.prototype = Object.create(Entity.prototype);
Paddle.prototype.constructor = Paddle;

Paddle.prototype.update = function() {
  Entity.prototype.update.apply(this, arguments);

  this.y = Math.min(Math.max(this.y, 0), game.height - this.height);
};
