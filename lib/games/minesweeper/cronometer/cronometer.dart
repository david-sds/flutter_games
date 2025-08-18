import 'package:flutter/material.dart';
import 'package:flutter_games/games/minesweeper/cronometer/cronometer_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

const maxNumberOfSeconds = 1.0 * 60 * 60;

class Cronometer extends StatefulWidget {
  const Cronometer({
    required this.controller,
    super.key,
  });

  final CronometerController controller;

  @override
  State<Cronometer> createState() => _CronometerState();
}

class _CronometerState extends State<Cronometer> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (widget.controller.isStarted && !widget.controller.isEnded) {
        return TweenAnimationBuilder(
          tween: Tween<double>(
            begin: 0,
            end: maxNumberOfSeconds,
          ),
          duration: (Duration(
            seconds: maxNumberOfSeconds.round(),
          )),
          builder: (context, value, child) {
            return Text('${value.toStringAsFixed(3)}s');
          },
        );
      }

      return Text('${widget.controller.elapsedTime.toStringAsFixed(3)}s');
    });
  }
}
