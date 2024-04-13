part of 'radio_station_bloc.dart';

/// RadioStationState class
class RadioStationState extends Equatable {
  ///
  const RadioStationState({
    this.status = RadioStationStatus.initial,
    this.radioStationsList = const [],
    this.failure,
  });

  /// RadioStationState status
  final RadioStationStatus status;

  /// RadioStationState radioStationsList
  final List<RadioStation> radioStationsList;

  /// RadioStationState failure
  final String? failure;

  @override
  List<Object?> get props => [status, radioStationsList, failure];

  /// RadioStationState copyWith method
  RadioStationState copyWith({
    RadioStationStatus? status,
    List<RadioStation>? radioStationsList,
    String? failure,
  }) {
    return RadioStationState(
      status: status ?? this.status,
      radioStationsList: radioStationsList ?? this.radioStationsList,
      failure: failure ?? this.failure,
    );
  }
}
