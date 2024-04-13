/// Helper class to manage url
class ApiHelper {
  //TODO change apihelper urls
  ///Base url
  static String baseUrl = 'http://de1.api.radio-browser.info/json/';

//TODO remove stations limit after lazy loading
  ///Url to request stations
  static String getStationsUrl = 'stations?limit=10';
}
