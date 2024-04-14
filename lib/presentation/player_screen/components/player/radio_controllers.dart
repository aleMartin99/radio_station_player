import 'package:assets_audio_player/assets_audio_player.dart' as assets_player;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_station_player/presentation/player_screen/components/player/soft_button.dart';
import 'package:radio_station_player/presentation/player_screen/player_cubit/player_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

///RadioStationsControllers class
class RadioStationsControllers extends StatelessWidget {
  ///
  const RadioStationsControllers({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerCubit, PlayerState>(
      builder: (context, playerState) {
        return playerState.status == PlayerStatus.loading
            ? SizedBox(
                height: 8.5.h,
                child: Center(
                  child: SizedBox(
                    height: 28.sp,
                    child: const CupertinoActivityIndicator(),
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.transparent,
                    height: 40,
                    width: 40,
                    child: GestureDetector(
                      onTap: () async {
                        await context.read<PlayerCubit>().volumeDown();
                      },
                      child: Icon(
                        CupertinoIcons.volume_down,
                        color: Colors.black,
                        size: 18.5.sp,
                      ),
                    ),
                  ),

                  /// PlayerBuilder used to indicate if loading the radio audio
                  assets_player.PlayerBuilder.isBuffering(
                    player: playerState.player!,
                    builder: (context, isBuffering) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.sp),
                        child: CircularSoftButton(
                          radius: 30,
                          padding: 6,
                          icon: assets_player.PlayerBuilder.isPlaying(
                            player: playerState.player!,
                            builder: (context, isPlaying) {
                              return GestureDetector(
                                onTap: () async {
                                  try {
                                    await context
                                        .read<PlayerCubit>()
                                        .playOrPause();
                                  } catch (t) {
                                    if (kDebugMode) {
                                      print(t);
                                    }
                                  }
                                },
                                child: isBuffering
                                    ? const CupertinoActivityIndicator()
                                    : isPlaying
                                        ? Icon(
                                            Icons.pause,
                                            size: 26.sp,
                                          )
                                        : Icon(
                                            Icons.play_arrow,
                                            size: 28.sp,
                                            // color: Theme.of(context)
                                            //     .colorScheme
                                            //     .primary,
                                          ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),

                  Container(
                    color: Colors.transparent,
                    height: 40,
                    width: 40,
                    child: GestureDetector(
                      onTap: () async {
                        await context.read<PlayerCubit>().volumeUp();
                      },
                      child: Icon(
                        CupertinoIcons.volume_up,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ],
              );
      },
    );
  }
}
