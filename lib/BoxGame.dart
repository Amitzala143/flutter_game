import 'dart:math';
import 'dart:ui';

import 'package:flame/components/particle_component.dart';
import 'package:flame/game.dart';
import 'package:flame/particle.dart';
import 'package:flame/particles/accelerated_particle.dart';
import 'package:flame/particles/circle_particle.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BoxGame extends BaseGame {
  Size screenSize;
  bool hasWon = false;
  int count = 0;



  void render(Canvas canvas) {
    // TODO: implement render

    double screenCenterX = screenSize.width / 2;
    double screenCenterY = screenSize.height / 2;
    Rect boxRect =
        Rect.fromLTWH(screenCenterX - 75, screenCenterY - 75, 150, 150);
    Paint boxPaint = Paint();
    if (hasWon) {
      boxPaint.color = Color(0xff00ff00);
    } else {
      boxPaint.color = Color(0xffffffff);
    }
    canvas.drawRect(boxRect, boxPaint);
  }

  void update(double t) {
    // TODO: implement update
  }

  void resize(Size size) {
    screenSize = size;
    super.resize(size);
  }

  void onTapDown(TapDownDetails d) {
    // handle taps here
    double screenCenterX = screenSize.width / 2;
    double screenCenterY = screenSize.height / 2;
    if (d.globalPosition.dx >= screenCenterX - 75 &&
        d.globalPosition.dx <= screenCenterX + 75 &&
        d.globalPosition.dy >= screenCenterY - 75 &&
        d.globalPosition.dy <= screenCenterY + 75) {
      count = count + 1;
      if (count == 20) {
        print("You Have won!!");
        hasWon = true;
      }
    } else {
      hasWon = false;
    }
  }


}
