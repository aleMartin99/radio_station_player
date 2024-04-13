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
