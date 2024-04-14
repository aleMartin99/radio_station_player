// ignore: lines_longer_than_80_chars
// ignore_for_file: collection_methods_unrelated_type, inference_failure_on_untyped_parameter

import 'package:radio_station_player/data/models/radio_station_model.dart';

/// RadioStation entity
class RadioStation {
  ///
  RadioStation({
    required this.isFavorite,
    this.id,
    this.name,
    this.url,
    this.image,
    this.country,
    this.countryCode,
    this.votes,
  });

  /// Radio station model fromModel method
  factory RadioStation.fromModel(RadioStationModel radioStationModel) {
    return RadioStation(
      id: radioStationModel.stationuuid,
      name: (radioStationModel.name!.isNotEmpty)
          ? radioStationModel.name
          : 'Radio station name',
      url: radioStationModel.url,
      image: radioStationModel.favicon,
      country: (radioStationModel.country!.isNotEmpty)
          ? radioStationModel.country
          : 'Radio station country',
      countryCode: radioStationModel.countrycode,
      votes: radioStationModel.votes,

      /// By default is false because there is no info about it in the api
      isFavorite: false,
    );
  }

  /// Radio station id
  final String? id;

  /// Radio station name
  final String? name;

  /// Radio station url to audio
  final String? url;

  /// Radio station image
  final String? image;

  /// Radio station country
  final String? country;

  /// Radio station country code
  final String? countryCode;

  /// Radio station votes
  final int? votes;

  /// Is favorite
  bool isFavorite;
}
