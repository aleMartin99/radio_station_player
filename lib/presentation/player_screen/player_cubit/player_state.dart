// ignore: lines_longer_than_80_chars
// ignore_for_file: prefer_const_constructors_in_immutables, public_member_api_docs

part of 'player_cubit.dart';

/// PlayerState calss
class PlayerState extends Equatable {
  ///
  const PlayerState({
    this.status = PlayerStatus.initial,
    this.radioStation,
    this.player,
    this.failure,
  });

  /// Status of the player bloc
  final PlayerStatus status;

  /// RadioStation
  final RadioStation? radioStation;

  /// Player
  final AssetsAudioPlayer? player;

  ///Failure
  final Failure? failure;

  @override
  List<Object?> get props => [
        status,
        radioStation,
        failure,
        player,
      ];

  PlayerState copyWith({
    PlayerStatus? status,
    RadioStation? radioStation,
    AssetsAudioPlayer? player,
    Failure? failure,
  }) {
    return PlayerState(
      status: status ?? this.status,
      radioStation: radioStation ?? this.radioStation,
      player: player ?? this.player,
      failure: failure ?? this.failure,
    );
  }
}
