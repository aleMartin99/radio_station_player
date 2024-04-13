// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_station_player/core/errors/failures.dart';
import 'package:radio_station_player/core/utils/utils_exports.dart';
import 'package:radio_station_player/domain/entities/radio_station.dart';

part 'player_state.dart';
part 'player_status.dart';

/// PlayerCubit class
class PlayerCubit extends Cubit<PlayerState> with BaseCubit {
  ///
  PlayerCubit() : super(const PlayerState());

  late AssetsAudioPlayer _player;

  /// Init AssetsAudioPlayer
  Future<void> initPlayer(RadioStation radioStation) async {
    try {
      _player = AssetsAudioPlayer.newPlayer();
      emit(state.copyWith(status: PlayerStatus.loading));
      _player.onErrorDo = (error) {
        error.player.stop();
      };
      await _player.open(
        Audio.liveStream(
          radioStation.url!,
          metas: Metas(
            title: radioStation.name,
            album: radioStation.country,
            artist: radioStation.countryCode,
            image: MetasImage.network(radioStation.image ?? ''),
          ),
        ),
        autoStart: false,
        showNotification: true,
        notificationSettings: const NotificationSettings(
          nextEnabled: false,
          prevEnabled: false,
          stopEnabled: false,
        ),
      );
      secureEmit(
        state.copyWith(
          status: PlayerStatus.initialized,
          player: _player,
        ),
      );
    } on Exception catch (e) {
      secureEmit(
        state.copyWith(
          failure: UnexpectedFailure(message: e.toString()),
          status: PlayerStatus.failure,
        ),
      );
    }
  }

  /// volumeUp method
  Future<void> volumeUp() async {
    try {
      await _player.setVolume(
        _player.volume.value + 0.2,
      );
    } on Exception catch (e) {
      secureEmit(
        state.copyWith(
          failure: UnexpectedFailure(message: e.toString()),
          status: PlayerStatus.failure,
        ),
      );
    }
  }

  /// volumeDown method
  Future<void> volumeDown() async {
    try {
      await _player.setVolume(
        _player.volume.value - 0.2,
      );
    } on Exception catch (e) {
      secureEmit(
        state.copyWith(
          failure: UnexpectedFailure(message: e.toString()),
          status: PlayerStatus.failure,
        ),
      );
    }
  }

  /// volumeDown method
  Future<void> playOrPause() async {
    try {
      await _player.playOrPause();
    } on Exception catch (e) {
      secureEmit(
        state.copyWith(
          failure: UnexpectedFailure(message: e.toString()),
          status: PlayerStatus.failure,
        ),
      );
    }
  }

  /// Dispose the player
  Future<void> disposePlayer() async {
    try {
      emit(state.copyWith(status: PlayerStatus.loading));

      await _player.dispose();
      secureEmit(
        state.copyWith(
          status: PlayerStatus.disposed,
        ),
      );
    } on Exception catch (e) {
      secureEmit(
        state.copyWith(
          failure: UnexpectedFailure(message: e.toString()),
          status: PlayerStatus.failure,
        ),
      );
    }
  }
}
