/// Helper class to manage url
class ApiHelper {
  /// Base url
  static String baseUrl = 'http://de1.api.radio-browser.info/json/';

  /// Url to request stations
  /// For mvp purposes only fetching 20 radio stations, normally this will be
  /// implemented with pagination
  static String getStationsUrl = 'stations?limit=20';
}
