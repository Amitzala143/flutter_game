


import 'package:flame/components/particle_component.dart';
import 'package:flame/flame.dart';
import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';



import 'dart:async';
import 'dart:ui';
import 'package:flame/particles/computed_particle.dart';
import 'package:flutter/material.dart' hide Animation, Image;
import 'BoxGame.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();



  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  BoxGame game = BoxGame();
  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  runApp(game.widget);
  flameUtil.addGestureRecognizer(tapper);
  game.add(
      ParticleComponent(
        // Renders a circle which gradually
        // changes its color and size during the particle lifespan
          particle: ComputedParticle(
            lifespan: .4,
            renderer: (canvas, particle) => canvas.drawCircle(
              Offset.zero,
              particle.progress * 10,
              Paint()
                ..color = Color.lerp(
                  Colors.red,
                  Colors.blue,
                  particle.progress,
                ),
            ),
          )
      )
  );



}




