import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'models/lottie_animation.dart';

class LottieAnimationView extends StatelessWidget {
  final LottieAnimation animation;
  final bool repeat;
  final bool reverse;

  const LottieAnimationView({
    Key? key,
    required this.animation,
    this.repeat = true,
    this.reverse = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Lottie.asset(
        animation.fullPath,
        repeat: repeat,
        reverse: reverse,
      );
}

extension GetFullPath on LottieAnimation {
  String get fullPath => 'assets/lottie/$name.json';
}
