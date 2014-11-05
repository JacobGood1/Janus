part of physics;

abstract class PlayerMovement{
  var speed, vx, vy;
  _initPlayerMovement(){
    assert(checkDependencies(this, "PlayerMovement",
                            dependencies: ["InputProcessor", "Physics"]));
  }
  _updatePlayerMovement(num time){
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
    vx = speed;
  }
  moveDown(){
    vy = speed;
  }
  moveUp(){
    vy = -speed;
  }
  moveLeft(){
    vx = -speed;
  }
}

abstract class AccelerationAndFriction{
  double acceleration = 0.2,
         accelerationCap = 100.0,
         friction = 0.0,
         frictionSpeed = 0.96,
         accelerationSpeed = 1.5;
  Vector gravity = new Vector(0.0,1.0);


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