// ignore: lines_longer_than_80_chars
// ignore_for_file: use_build_context_synchronously, avoid_dynamic_calls, prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_station_player/domain/entities/radio_station.dart';
import 'package:radio_station_player/presentation/home_screen/radio_station_bloc/radio_station_bloc.dart';
import 'package:radio_station_player/presentation/player_screen/components/player/player_exports.dart';

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
  late final playerContextToDispose;

  @override
  void dispose() {
    // Dispose of the player with the old context
    playerContextToDispose.state.player!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    initPlayer();

    super.initState();
  }

  Future<void> initPlayer() async {
    await context.read<PlayerCubit>().initPlayer(widget.radioStation);

    // Storing a reference to the context of the PlayerCubit
    playerContextToDispose = context.read<PlayerCubit>();
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
                        onTap: () {
                          context.read<RadioStationBloc>().add(
                                OnShareRadioStationEvent(
                                  radioStation: widget.radioStation,
                                ),
                              );
                        },
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
