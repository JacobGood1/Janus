part of levels;

class Level1 extends Level{
  Level1():super(['gobby', 'back']);

  void init() {
    var gobby = new Goblin(200.0,100.0);
    var background = new Level1BackGround(gobby);
    new List.generate(1,(i) => new RectangleSpecial(gobby))..forEach((star) => addChild(star));
    addChild(background);
    addChild(gobby);
  }
  _updateLevel(){

  }

}