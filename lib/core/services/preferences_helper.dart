// ignore_for_file: omit_local_variable_types, prefer_final_locals

import 'package:shared_preferences/shared_preferences.dart';

/// UtilPreferences class
class UtilPreferences {
  ///
  factory UtilPreferences() {
    return _instance;
  }

  UtilPreferences._internal();

  SharedPreferences? _prefs;

  /// Init preferences
  Future<void> initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static final UtilPreferences _instance = UtilPreferences._internal();

  /// Returns a list with the id of the favorite radio stations
  List<String> getFavoriteRadioStationsId() {
    return _prefs?.getStringList('my_fav_radio_stations') ?? [];
  }

  /// Adds the id of the given radio station to the list of
  /// favorite radio stations
  Future<void> addFavoriteRadioStationId(String radioStationId) async {
    final favoriteRadioStations =
        _prefs?.getStringList('my_fav_radio_stations') ?? [];
    if (!favoriteRadioStations.contains(radioStationId)) {
      favoriteRadioStations.add(radioStationId);
      await _prefs?.setStringList(
        'my_fav_radio_stations',
        favoriteRadioStations,
      );
    }
  }

  /// Removes the id of the given radio station to the list of
  /// favorite radio stations
  Future<void> removeFavoriteRadioStationId(String radioStationId) async {
    final favoriteRadioStations =
        _prefs?.getStringList('my_fav_radio_stations') ?? [];
    if (favoriteRadioStations.contains(radioStationId)) {
      favoriteRadioStations.remove(radioStationId);
      await _prefs?.setStringList(
        'my_fav_radio_stations',
        favoriteRadioStations,
      );
    }
  }
}
