part of entity;

class Level1BackGround extends Entity{
  var player;
  Level1BackGround(this.player):super("back", 0.0, 0.0){
    scaleX = 2.0;
    scaleY = 2.0;
  }
  _updateScrolling(){
    position = new Vector(-1.0,-1.0) * player.position.copy() * new Vector(1/5,1/5);
  }



}