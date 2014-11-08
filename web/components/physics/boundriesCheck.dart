part of component;


abstract class StopAtStageBounds implements ComponentData{
  _updateStopAtStageBounds(){
    var isStageStop = false;
    double _stageStopX = position.x, _stageStopY = position.y;
    if(position.x > _stageBoundX){
      _stageStopX = _stageBoundX;
      velocity.x = 0.0;
      isStageStop = true;
    }
    if(position.x <= 0.0){
      _stageStopX = 0.0;
      velocity.x = 0.0;
      isStageStop = true;
    }
    if(position.y >= _stageBoundY){
      _stageStopY = _stageBoundY;
      velocity.y = 0.0;
      isStageStop = true;
    }
    if(position.y < 0.0){
      _stageStopY = 0.0;
      velocity.y = 0.0;
      isStageStop = true;
    }
    if(isStageStop){
      setPosition(new Vector(_stageStopX, _stageStopY));
    }
  }
}


abstract class WrapAtStageBounds implements ComponentData{

  _updateWrapAtStageBounds(){
  }
  _collisionCheckWrapAtStageBounds(){
    var isStageWrap = false;
    double _stageWrapX = position.x, _stageWrapY = position.y;
    if(position.x > _stageBoundX){
      _stageWrapX = 0.0;
      isStageWrap = true;
    }
    if(position.x < 0.0){
      _stageWrapX = _stageBoundX;
      isStageWrap = true;
    }
    if(position.y > _stageBoundY){
      _stageWrapY = 0.0;
      isStageWrap = true;
    }
    if(position.y < 0.0){
      _stageWrapY = _stageBoundY;
      isStageWrap = true;
    }
    if(isStageWrap){
      setPosition(new Vector(_stageWrapX, _stageWrapY));
    }
  }
}