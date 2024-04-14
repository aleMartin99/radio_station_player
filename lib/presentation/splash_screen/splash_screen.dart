// ignore: lines_longer_than_80_chars
// ignore_for_file: use_build_context_synchronously, no_leading_underscores_for_local_identifiers, inference_failure_on_instance_creation

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:radio_station_player/core/router/routes.dart';

/// Splash screen
class SplashScreen extends StatefulWidget {
  ///
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    /// releasing animationController resources
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(milliseconds: 3000),
    ).then((value) {
      /// Navigating to home screen after splash animation
      Navigator.of(context).pushNamedAndRemoveUntil(
        AppRoutes.homeScreenRoute,
        (Route<dynamic> route) => false,
      );
    });

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child:
            // Load the Lottie file from the assets
            Lottie.asset(
          'assets/animations/splash-animation.json',
          controller: _controller,
          onLoaded: (composition) {
            // Configure the AnimationController with the duration of the
            // Lottie file and start the animation.
            _controller
              ..duration = composition.duration
              ..forward();
          },
        ),
      ),
    );
  }
}
