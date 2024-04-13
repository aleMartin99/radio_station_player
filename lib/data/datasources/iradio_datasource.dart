// ignore_for_file: one_member_abstracts

import 'package:fpdart/fpdart.dart';
import 'package:radio_station_player/core/errors/failures.dart';
import 'package:radio_station_player/data/models/radio_station_model.dart';

/// Radio Datasource interface
abstract class IRadioDatasource {
  /// getRadioStations method for IRadioDatasource
  Future<Either<Failure, List<RadioStationModel>>> getRadioStations();
}
