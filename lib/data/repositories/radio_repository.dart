import 'package:fpdart/fpdart.dart';
import 'package:radio_station_player/core/errors/failures.dart';
import 'package:radio_station_player/data/datasources/iradio_datasource.dart';
import 'package:radio_station_player/data/models/radio_station_model.dart';
import 'package:radio_station_player/domain/entities/radio_station.dart';
import 'package:radio_station_player/domain/repositories/iradio_repository.dart';

/// RadioRepository implementation
class RadioRepository implements IRadioRepository {
  ///
  RadioRepository(this.datasource);

  /// RadioDatasource
  final IRadioDatasource datasource;

  @override
  Future<Either<Failure, List<RadioStation>>> getRadioStations() async {
    final getRadioStationsResponse = await datasource.getRadioStations();
    if (getRadioStationsResponse.isRight()) {
      final radioStationsModelList =
          (getRadioStationsResponse as Right).value as List<RadioStationModel>;

      // Convert from RadioStationModel to RadioStationEntity
      final radioStationsList = radioStationsModelList
          .map(
            RadioStation.fromModel,
          )
          .toList();

      return right(radioStationsList);
    } else {
      return left((getRadioStationsResponse as Left).value as Failure);
    }
  }
}
