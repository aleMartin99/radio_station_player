/// Radio station model
class RadioStationModel {
  ///
  const RadioStationModel({
    this.stationuuid,
    this.name,
    this.url,
    this.favicon,
    this.country,
    this.countrycode,
    this.votes,
  });

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting
  /// Json object as [RadioStationModel].
  factory RadioStationModel.fromJson(Map<String, dynamic> data) {
    return RadioStationModel.fromMap(data);
  }

  /// Radio station model fromMap method
  factory RadioStationModel.fromMap(Map<String, dynamic> data) {
    return RadioStationModel(
      stationuuid: data['stationuuid'] as String?,
      //Convert the string and return name without left spaces
      name: (data['name'] as String?)?.trimLeft(),
      url: data['url'] as String?,
      favicon: data['favicon'] as String?,
      country: data['country'] as String?,
      countrycode: data['countrycode'] as String?,
      votes: data['votes'] as int?,
    );
  }

  /// Radio station id
  final String? stationuuid;

  /// Radio station name
  final String? name;

  /// Radio station url to audio
  final String? url;

  /// Radio station image
  final String? favicon;

  /// Radio station country
  final String? country;

  /// Radio station countryCode
  final String? countrycode;

  /// Radio station votes
  final int? votes;
}
