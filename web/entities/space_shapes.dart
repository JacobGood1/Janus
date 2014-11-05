part of entity;



class Star extends Entity with WrapAtStageBounds{
  Shape circ = new Shape();
  Goblin player;
  var radius = rng.nextInt(3);
  Star(Goblin this.player):super("", rng.nextInt(640).toDouble(), rng.nextInt(480).toDouble()){

    circ.graphics..circle(position.x, position.y, radius)..fillColor(Color.Blue);
    addChild(circ);
    stage.addChild(circ);
  }

  _updateStar(){
    velocity = player.velocity.copy().negate().scale(1/8);
    position += velocity;

    circ.graphics.clear();

    circ.graphics..circle(position.x, position.y, radius)..fillColor(Color.Blue);


  }

}

class RectangleSpecial extends Entity with WrapAtStageBounds{
  Shape rectum = new Shape();
  Goblin player;
  var radius = rng.nextInt(3);
  RectangleSpecial(Goblin this.player):super("", rng.nextInt(640).toDouble(), rng.nextInt(480).toDouble()){
    rectum.graphics..rect(position.x, position.y, radius,radius)..fillColor(Color.Blue);
    addChild(rectum);
    stage.addChild(rectum);

  }

  _updateStar(){
    velocity = player.velocity.copy().negate().scale(1/8);
    position += velocity;

    rectum.graphics.clear();

    rectum.graphics..rect(position.x, position.y, radius, radius)..fillColor(Color.Blue);


  }
}

