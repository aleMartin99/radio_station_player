import 'package:flutter/material.dart';
import 'package:radio_station_player/domain/entities/radio_station.dart';
import 'package:radio_station_player/presentation/player_screen/components/player_body.dart';

/// Player screen
class PlayerScreen extends StatelessWidget {
  ///
  const PlayerScreen({required this.radioStation, super.key});

  ///
  final RadioStation radioStation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlayerBody(radioStation: radioStation),
    );
  }
}
