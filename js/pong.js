var canvas = $('canvas')[0],
    game = new Game(canvas);

game.entities = [
  new Background(),
  game.ball   = new Ball(),
  game.player = new Player(),
  game.bot    = new Bot()
];


game.start();
canvas.focus();
