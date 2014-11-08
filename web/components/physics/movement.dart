part of component;



abstract class PlayerMovement implements PlayerComponentData{

  _updatePlayerMovement(){
    if(isKeyBeingPressed('d')){
      moveRight();
    }
    if(isKeyBeingPressed('a')){
      moveLeft();
    }
    if(isKeyBeingPressed('s')){
      moveDown();
    }
    if(isKeyBeingPressed('w')){
      moveUp();
    }
    if(!areAnyOfTheseKeysActive(['a','d'])){
      //vx = 0;
    }
    if(!areAnyOfTheseKeysActive(['w','s'])){
      //vy = 0;
    }
  }

  moveRight(){
    position += speed;
  }
  moveDown(){
    position.y += speed.x;
  }
  moveUp(){
    position.y += speed.negate().x;
  }
  moveLeft(){
    position.x += speed.negate().x;
  }
}

abstract class AccelerationAndFriction implements PlayerComponentData{
  double acceleration = 0.2,
         accelerationCap = 100.0,
         friction = 0.0,
         frictionSpeed = 0.96,
         accelerationSpeed = 0.2;
  Vector gravity = new Vector(0.0,0.0);


  _updateAccelerationAndFriction(){
    Vector accelerationVector = new Vector(acceleration * cos(rotation), acceleration * sin(rotation)),
           frictionVector = velocity.scale(friction);

    if(!isKeyBeingPressed('w')){
      acceleration = 0.0;
      friction = frictionSpeed;
      if(abs(velocity.x) < 0.1 && abs(velocity.y) < 0.1){
        accelerationVector.zero();
        frictionVector.zero();
      }
    }
    if(areAnyOfTheseKeysActive(['w'])){
      friction = 1.0;
      acceleration = accelerationSpeed;
    }
    if(areAnyOfTheseKeysActive(['a'])){
      rotation -= rotationSpeed * 3.14159/180;
    }
    if(areAnyOfTheseKeysActive(['d'])){
      rotation += rotationSpeed * 3.14159/180;
    }
    position += accelerationVector + frictionVector + gravity;
  }
}