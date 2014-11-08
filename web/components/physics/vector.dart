part of component;
//TODO implement vector normals and draw debug

class Vector{
  double x,y;
  stagexl.Shape _vectorShape = new stagexl.Shape();
  Point a = new Point(0,0),b = new Point(0,0);

  bool firstTime = true;

  Vector(this.x, this.y);

  drawVector(position){
    if(firstTime) {
      //a = new Point(x, y);
      stage.addChild(_vectorShape);
      firstTime = false;
    }

    a = new Point(position.x,position.y);
    leftNormal.b = new Point(this.a.x + leftNormal.x, this.a.y + leftNormal.y);
    _vectorShape.graphics.clear();
    _vectorShape.graphics
      ..beginPath()
      ..moveTo(position.x,position.y)
      ..lineTo(position.x + leftNormal.x, position.y + leftNormal.y)
      ..moveTo(position.x,position.y)
      ..lineTo(position.x + rightNormal.x, position.y + rightNormal.y)
      ..closePath()
      ..strokeColor(stagexl.Color.Black, 5);



  }


  operator +(Vector other) => new Vector(x + other.x, y + other.y);
  operator -(Vector other) => new Vector(x - other.x, y - other.y);
  operator *(Vector other) => new Vector(x * other.x, y * other.y);
  operator /(Vector other) => new Vector(x / other.x, y / other.y);
  //operator >(Vector other) {if((this.x + this.y) > (other.x + other.y)){return true;} return false;}

  get leftNormal => new Vector(y,-x);
  get rightNormal => new Vector(-y,x);

  Vector copy(){
    return new Vector(this.x, this.y);
  }

  Vector scale(num scalar){
    return new Vector(x * scalar, y * scalar);
  }
  void zero(){
    x = 0.0;
    y = 0.0;
  }
  Vector negate(){
    return new Vector(x * -1, y * -1);
  }

  toString(){
    return "[x:$x y:$y]";
  }
}

num abs(num n){
  if(n.isNegative){
    return n * -1;
  }
  return n;
}


num degreesToRadians(num degrees){
  return degrees * PI / 180;
}
