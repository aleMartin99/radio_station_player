// ignore_for_file: public_member_api_docs

part of 'radio_station_bloc.dart';

enum RadioStationStatus {
  initial,
  loading,
  loadingToggleFavorite,
  success,
  failure,
  sharedRadioStation,
  isFavRadioStation,
  isNotFavRadioStation
}
