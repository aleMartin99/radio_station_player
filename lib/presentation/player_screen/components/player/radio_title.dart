import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:radio_station_player/domain/entities/radio_station.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

///RadioStationTitle class
class RadioStationTitle extends StatelessWidget {
  ///
  const RadioStationTitle({required this.radioStation, super.key});

  ///
  final RadioStation radioStation;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 40),
      child: Column(
        children: [
          SizedBox(
            height: 24.sp,

            /// Marquee is the widget that animates the title text
            child: Marquee(
              text: radioStation.name ?? 'Radio station name',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 19.sp,
              ),
              crossAxisAlignment: CrossAxisAlignment.start,
              blankSpace: 20,
              velocity: 100,
              pauseAfterRound: const Duration(seconds: 1),
              startPadding: 10,
              accelerationDuration: const Duration(seconds: 1),
              accelerationCurve: Curves.linear,
              decelerationDuration: const Duration(milliseconds: 500),
              decelerationCurve: Curves.easeOut,
            ),
          ),
          Text(
            radioStation.country ?? 'Radio station country',
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(
              color: Theme.of(context).textTheme.titleMedium!.color,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
