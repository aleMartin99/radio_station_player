// ignore_for_file: use_build_context_synchronously

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_station_player/domain/entities/radio_station.dart';
import 'package:radio_station_player/presentation/player_screen/components/player/widgets/soft_button.dart';
import 'package:radio_station_player/presentation/player_screen/components/player/widgets/radio_circle_container.dart';
import 'package:radio_station_player/presentation/player_screen/components/player/widgets/radio_controllers.dart';
import 'package:radio_station_player/presentation/player_screen/components/player/widgets/radio_title.dart';
import 'package:radio_station_player/presentation/player_screen/player_cubit/player_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

/// Body of Player screen
class PlayerBody extends StatefulWidget {
  ///
  const PlayerBody({required this.radioStation, super.key});

  ///
  final RadioStation radioStation;
  @override
  State<PlayerBody> createState() => _PlayerBodyState();
}

class _PlayerBodyState extends State<PlayerBody> with TickerProviderStateMixin {
//TODO check dispose method

  // @override
  // void dispose() {
  //   disposePlayer();
  //   super.dispose();
  // }

  @override
  void initState() {
    initPlayer();
    super.initState();
  }

  Future<void> initPlayer() async {
    await context.read<PlayerCubit>().initPlayer(widget.radioStation);
  }

  Future<void> disposePlayer() async {
    await context.read<PlayerCubit>().disposePlayer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: 1,
              height: 70.h,
              width: MediaQuery.sizeOf(context).width,
              child: Center(
                child: Hero(
                  tag: widget.radioStation.id!,
                  child: RadioStationCircleContainer(
                    image: widget.radioStation.image ?? '',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        color: Colors.black,
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(CupertinoIcons.back),
                      ),

                      ///Amount of favorites votes
                      Tooltip(
                        message: 'Votes: ${widget.radioStation.votes}',
                        child: CircularSoftButton(
                          radius: 25,
                          padding: 10,
                          icon: GestureDetector(
                            //TODO implement add to favorite
                            onTap: () async {},

                            child: const Icon(Icons.favorite),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CircularSoftButton(
                      radius: 25,
                      padding: 10,
                      icon: GestureDetector(
                        //TODO implement share
                        onTap: () async {},

                        child: Icon(
                          CupertinoIcons.share,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: RadioStationTitle(
                      radioStation: widget.radioStation,
                    ),
                  ),
                  const RadioStationsControllers(),
                  SizedBox(
                    height: 7.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
