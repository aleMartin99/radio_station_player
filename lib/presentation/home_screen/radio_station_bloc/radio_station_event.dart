part of 'radio_station_bloc.dart';

///RadioStation base Event class
sealed class RadioStationEvent extends Equatable {}

///OnLoadRadioStationsEvent class
class OnLoadRadioStationsEvent extends RadioStationEvent {
  ///
  OnLoadRadioStationsEvent();

  @override
  List<Object> get props => [];
}

///OnLoadRadioStationsEvent class
class OnShareRadioStationEvent extends RadioStationEvent {
  ///
  OnShareRadioStationEvent({required this.radioStation});

  /// Radio station to share
  final RadioStation radioStation;

  @override
  List<Object> get props => [radioStation];
}

///OnToggleFavoriteRadioStationEvent class
class OnToggleFavoriteRadioStationEvent extends RadioStationEvent {
  ///
  OnToggleFavoriteRadioStationEvent({
    required this.radioStationId,
    required this.isFavorite,
  });

  /// Radio station id
  final String radioStationId;

  /// Favorite state to toggle
  final bool isFavorite;

  @override
  List<Object> get props => [radioStationId, isFavorite];
}
