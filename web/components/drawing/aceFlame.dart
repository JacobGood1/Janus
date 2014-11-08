part of component;


abstract class AceFlames implements PlayerComponentData{
  double _flameScale = 0.0;
  stagexl.Shape _aceFlameShape = new stagexl.Shape();
  var _radius = 10, _leftPoint, _topPoint, _rightPoint, _centerPoint;

  _initAceFlames(){
    addChild(_aceFlameShape);
    _aceFlameShape.scaleX = 8;
    _aceFlameShape.scaleY = 8;
    _aceFlameShape.pivotX = _aceFlameShape.width / 2;
    _aceFlameShape.pivotY = _aceFlameShape.height / 2;
  }


  _updateAceFlames(){
    if(areAnyOfTheseKeysActive(['w'])){
      aceFlames();
    }
    else{
      _flameScale = 0.0;
      _aceFlameShape.graphics.clear();
    }
  }

  aceFlames(){
    _radius = _flameScale;
    _centerPoint = new Vector(0.0, 30.0);
    _leftPoint = _centerPoint + new Vector(_radius * cos(degreesToRadians(90)), _radius * sin(degreesToRadians(90)));
    _topPoint = _centerPoint + new Vector(_radius * cos(degreesToRadians(180)), _radius * sin(degreesToRadians(180)));
    _rightPoint = _centerPoint + new Vector(_radius * cos(degreesToRadians(-90)), _radius * sin(degreesToRadians(-90)));
    //[_leftPoint, _topPoint, _rightPoint].forEach((p) => p *= )
    _aceFlameShape.graphics.clear();
   _aceFlameShape.graphics
      ..beginPath()

    //..lineTo(position.x+1,position.y+1)
      ..lineTo(_leftPoint.x, _leftPoint.y)
      ..lineTo(_topPoint.x, _topPoint.y)
      ..lineTo(_rightPoint.x, _rightPoint.y)
      ..closePath()
      ..strokeColor(stagexl.Color.Black, 5);

    _flameScale += 0.1;
    if(_flameScale > 20){
      _flameScale = 0.0;
    }
  }
}