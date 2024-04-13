import 'package:flutter/material.dart';
import 'package:radio_station_player/presentation/home_screen/components/home_body.dart';

/// Home screen
class HomeScreen extends StatelessWidget {
  ///
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeBody(),
    );
  }
}
