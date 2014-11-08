part of entity;



class Goblin extends Entity with InputProcessor, PlayerMovement, WrapAtStageBounds, AceFlames{

  //TODO investigate constructor timing
  //TODO possible make a component generator

  double rotationSpeed = 5.0;
  Goblin([startX = 500.0,startY = 500.0]):super("gobby", startX, startY){
    scaleX = 1/8;
    scaleY = 1/8;
    speed = new Vector(1.0,0.0);
    addChild(appearance);
  }
}







