part of component;

abstract class AceFlames implements ComponentData{
  var flameScale = 0.0;
  stagexl.Shape shape = new stagexl.Shape();
  var _radius = 10, leftPoint, topPoint, rightPoint, centerPoint;

  _initAceFlames(){
    addChild(shape);
    shape.scaleX = 8;
    shape.scaleY = 8;
    shape.pivotX = shape.width / 2;
    shape.pivotY = shape.height / 2;
    print('aceFlame');
  }
  _updateAceFlames(){
    if(areAnyOfTheseKeysActive(['w'])){
      aceFlames();
    }
    else{
      flameScale = 0.0;
      shape.graphics.clear();
    }
  }

  aceFlames(){
    _radius = flameScale;
    centerPoint = new Vector(0.0, 30.0);
    leftPoint = centerPoint + new Vector(_radius * cos(degreesToRadians(90)), _radius * sin(degreesToRadians(90)));
    topPoint = centerPoint + new Vector(_radius * cos(degreesToRadians(180)), _radius * sin(degreesToRadians(180)));
    rightPoint = centerPoint + new Vector(_radius * cos(degreesToRadians(-90)), _radius * sin(degreesToRadians(-90)));
    //[leftPoint, topPoint, rightPoint].forEach((p) => p *= )
    shape.graphics.clear();
    shape.graphics
      ..beginPath()

    //..lineTo(position.x+1,position.y+1)
      ..lineTo(leftPoint.x, leftPoint.y)
      ..lineTo(topPoint.x, topPoint.y)
      ..lineTo(rightPoint.x, rightPoint.y)
      ..closePath()
      ..strokeColor(stagexl.Color.Black, 5);

    flameScale += 0.1;
    if(flameScale > 20){
      flameScale = 0;
    }
  }
}