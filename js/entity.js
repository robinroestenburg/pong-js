function Entity() {
  // A game entity has ...

  // A position
  this.x = 0;
  this.y = 0;

  // Dimensions
  this.width = 0;
  this.height = 0;

  // A velocity: speed with direction.
  this.xVelocity = 0;
  this.yVelocity = 0;
}

Entity.prototype.update = function() {
  this.x += this.xVelocity;
  this.y += this.yVelocity;
};

Entity.prototype.draw = function(context) {
  context.fillStyle = '#fff';
  context.fillRect(this.x, this.y, this.width, this.height);
};

// Basic bounding box collision detection.
// Returns `true` if the entity intersect with another one.
Entity.prototype.intersect = function(other) {
  return this.y + this.height > other.y &&
         this.y               < other.y + other.height &&
         this.x + this.width  > other.x &&
         this.x               < other.x + other.width;
};
