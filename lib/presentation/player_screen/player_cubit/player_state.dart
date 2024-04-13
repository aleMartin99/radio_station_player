// ignore_for_file: prefer_const_constructors_in_immutables

part of 'player_cubit.dart';

class PlayerState extends Equatable {
  const PlayerState({
    this.status = PlayerStatus.initial,
    this.radioStation,
    this.player,
    this.failure,
  });

  final PlayerStatus status;
  final RadioStation? radioStation;
  final AssetsAudioPlayer? player;
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
