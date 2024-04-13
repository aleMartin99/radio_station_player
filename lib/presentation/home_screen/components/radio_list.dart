import 'package:flutter/material.dart';
import 'package:radio_station_player/core/router/app_router.dart';
import 'package:radio_station_player/core/router/routes.dart';
import 'package:radio_station_player/domain/entities/radio_station.dart';
import 'package:radio_station_player/presentation/home_screen/components/radio_widget.dart';

/// RadioStationListItem class
class RadioStationListItem extends StatelessWidget {
  ///
  const RadioStationListItem({required this.radioStation, super.key});

  ///
  final RadioStation radioStation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: GestureDetector(
        onTap: () async {
          await Navigator.pushNamed(
            context,
            AppRoutes.playerScreenRoute,
            arguments: PlayerArguments(
              radioStation,
            ),
          );
        },
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow,
                offset: const Offset(8, 6),
                blurRadius: 12,
              ),
              const BoxShadow(
                color: Colors.white,
                offset: Offset(-8, -6),
                blurRadius: 12,
              ),
            ],
          ),
          child: RadioStationWidget(
            radioStation: radioStation,
          ),
        ),
      ),
    );
  }
}
