library component;

import 'package:stagexl/stagexl.dart' as stagexl;
import 'dart:math';
import '../entity.dart' show canvas;

part 'physics/physics.dart';
part 'physics/boundriesCheck.dart';
part 'physics/movement.dart';

part 'drawing/aceFlame.dart';

double _stageBoundX = canvas.width.toDouble(),
       _stageBoundY = canvas.height.toDouble();

abstract class ComponentData{
  Vector position, speed, velocity;

  double rotation, rotationSpeed;

  void setPosition(Vector vector);
  void addChild(stagexl.DisplayObject child);

  bool isKeyBeingPressed(String key);
  bool areAnyOfTheseKeysActive(List<String> keys);
}

