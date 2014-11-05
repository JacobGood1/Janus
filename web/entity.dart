library entity;

import 'package:stagexl/stagexl.dart' show Bitmap, Sprite, ResourceManager, Stage, Shape, Color;
import 'dart:mirrors';
import 'physics/physics.dart';
import 'dart:html';
import 'dart:math';

part 'entities/goblin.dart';
part 'entities/backGrounds.dart';
part 'entities/space_shapes.dart';

final RegExp _init = new RegExp(r"\_init[A-Z][a-z]*");
final RegExp _update = new RegExp(r"\_update[A-Z][a-z]*");
final RegExp _collision = new RegExp(r"\_collision[A-Z][a-z]*");

int WIDTH = 640, HEIGHT = 480;

CanvasElement canvas = querySelector('#stage');
Stage stage = new Stage(canvas, width: WIDTH, height: HEIGHT, webGL: false);
ResourceManager resourceManager = new ResourceManager();
RegExp _depTestReg = new RegExp(r"(\.[A-Z][a-zA-z]+)");

Random rng = new Random();

initGlobals(){
  canvas
    ..width = WIDTH
    ..height = HEIGHT;
}





abstract class Entity extends Sprite{

  List<Symbol> _componentUpdateFunctionList = [],
               _componentCollisionCheckFunctionList = [];

  InstanceMirror _lookAtMe;

  Vector
    speed,
    position,
    previousPosition,
    temporaryPosition;


  Bitmap appearance;


  Entity(String appearanceName, num startX, num startY){
    _lookAtMe = reflect(this);
    if(!(appearanceName == '')){
      appearance = new Bitmap(resourceManager.getBitmapData(appearanceName));
      pivotX = appearance.width / 2;
      pivotY = appearance.height / 2;
    }


    position = new Vector(startX, startY);
    previousPosition = new Vector(startX,startY);
    temporaryPosition = new Vector(startX,startY);


    //addChild(appearance);
    _addAllSuperClassMethodsToComponentFunctionList(this);
  }

  _addAllSuperClassMethodsToComponentFunctionList(Object obj){
    InstanceMirror instanceMirror = reflect(obj);
    ClassMirror currentClass = instanceMirror.type;
    Map members;
    while(currentClass.simpleName != #Object){
      members = currentClass.declarations;
      for(var i in members.values){
        if(!(null == _init.firstMatch(i.simpleName.toString()))){
          instanceMirror.invoke(i.simpleName, []);
        }
        else if(!(null == _update.firstMatch(i.simpleName.toString()))){
          if(!(i.simpleName.toString().contains("Drag"))){
            _componentUpdateFunctionList.add(i.simpleName);
          }
        }
        else if(!(null == _collision.firstMatch(i.simpleName.toString()))){
            if(!(i.simpleName.toString().contains("Drag"))){
              _componentCollisionCheckFunctionList.add(i.simpleName);
            }
          }
      }
      currentClass = currentClass.superclass;
    }
  }

  updateAllComponents(){
    //Update
    temporaryPosition = position.copy();

    for(var i = _componentUpdateFunctionList.length - 1; i >= 0; i--){
      _lookAtMe.invoke(_componentUpdateFunctionList[i], []);

    }
    previousPosition = temporaryPosition.copy();
    //Check Collisions
    for(var i = _componentCollisionCheckFunctionList.length - 1; i >= 0; i--){
      _lookAtMe.invoke(_componentCollisionCheckFunctionList[i], []);
    }
    //Finally, position the objects
    this..x = position.x
        ..y = position.y;

  }

  get velocity => position - previousPosition;

  set velocity(vector) => previousPosition = position - vector;

  setPosition(vector){
    previousPosition = vector - velocity;
    position = vector.copy();
  }

  bool checkDependencies(Object ref, String thisObject, {List<String> dependencies}){
    List enumerateObjects =
    _depTestReg.allMatches(reflect(ref).type.superclass.toString())
    .map((e) => e.group(0).substring(1, e.group(0).length))
    .toList();
    for(var i in dependencies){
      if(!enumerateObjects.contains(i)){
        return false;
      }
    }

    return true;
  }


}

class InputProcessor{
  String currentKey = '';
  Set currentActiveKey = new Set();
  Map _keyDecipher;

  Map<String,bool> keysPressed = {'d': false, 'w': false, 'a': false, 's': false};
  _initInputProcessor(){
    _keyDecipher = new Map.fromIterables(new List.generate(26, (int index) => index + 65), "abcdefghijklmnopqrstuvwxyz".split(""));
    stage.onKeyDown.listen((e) {
      keysPressed[_keyDecipher[e.keyCode]] = true;
      currentActiveKey.add(_keyDecipher[e.keyCode]);
    });
    stage.onKeyUp.listen((e) {
      keysPressed[_keyDecipher[e.keyCode]] = false;
      currentActiveKey.remove(_keyDecipher[e.keyCode]);
    });

  }

  _updateInputProcessor(){
    if(isAnyKeyDown()){
      currentKey = currentActiveKey.last;
    }
    else{
      currentKey = '';
    }
  }

  bool isKeyBeingPressed(String key){
    return currentKey == key;
  }
  bool areAnyOfTheseKeysActive(List<String> keys){
    for(var key in keys){
      if(keysPressed[key]){
        return true;
      }
    }
    return false;
  }
  bool isAnyKeyDown(){
    return !currentActiveKey.isEmpty;
  }
}







