import 'dart:convert';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:radio_station_player/core/constants/api_helper.dart';
import 'package:radio_station_player/core/errors/failures.dart';
import 'package:radio_station_player/data/datasources/iradio_datasource.dart';
import 'package:radio_station_player/data/models/radio_station_model.dart';

/// RadioDatasource implementation
class RadioDatasource implements IRadioDatasource {
  @override
  Future<Either<Failure, List<RadioStationModel>>> getRadioStations() async {
    try {
      final response = await http.get(
        Uri.parse(
          ApiHelper.baseUrl + ApiHelper.getStationsUrl,
        ),
      );
      if (response.statusCode == 200) {
        final radioStationData = json.decode(response.body) as List<dynamic>;

        return right(
          radioStationData
              .map(
                (radioStation) => RadioStationModel.fromJson(
                  radioStation as Map<String, dynamic>,
                ),
              )
              .toList(),
        );
      } else {
        return left(const ServerFailure());
      }
    } catch (e) {
      return left(UnexpectedFailure(message: e.toString()));
    }
  }
}
