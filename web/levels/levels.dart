library levels;

import 'package:stagexl/stagexl.dart';
import '../entity.dart';

part 'level1.dart';

var stageChildren = new List();
void addChild(Sprite sprite){
  stage.addChild(sprite);
  stageChildren.add(sprite);
}
void removeChild(Sprite sprite){
  stage.removeChild(sprite);
  stageChildren.remove(sprite);
}

abstract class Level{
  //user must have an images folder in the web directory!
  Level(List<String> assetsToLoad){
    for(num i = 0; i < assetsToLoad.length; i++){
      resourceManager.addBitmapData(assetsToLoad[i], 'images/${assetsToLoad[i]}.png');
    }
    resourceManager.load().then((result){
      init();
    });
  }

  void init();
  updateSprites(num time){
    stageChildren.forEach((sprite) => sprite.updateAllComponents());
  }
  handleCollisions(){}
  cleanUp(){}
}


