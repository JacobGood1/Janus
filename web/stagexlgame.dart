import 'package:stagexl/stagexl.dart';
import 'levels/levels.dart';
import 'entity.dart';

//place canvas stage into html to use the game loop +++ <canvas id="stage"></canvas>
class GameLoop extends Animatable{
  advanceTime(num time){
    currentLevel..updateSprites(time)
                ..handleCollisions()
                ..cleanUp();
  }
}
Level currentLevel;
GameLoop gameLoop = new GameLoop();
RenderLoop renderLoop = new RenderLoop();
main(){
  initGlobals();
  currentLevel = new Level1();
  stage.juggler.add(gameLoop);
  renderLoop.addStage(stage);
  stage.focus = stage;
}