import 'package:radio_station_player/data/models/radio_station_model.dart';

/// RadioStation entity
class RadioStation {
  ///
  const RadioStation({
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
      name: radioStationModel.name,
      url: radioStationModel.url,
      image: radioStationModel.favicon,
      country: radioStationModel.country,
      countryCode: radioStationModel.countrycode,
      votes: radioStationModel.votes,
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
}
