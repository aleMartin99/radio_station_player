// ignore_for_file: one_member_abstracts

import 'package:fpdart/fpdart.dart';
import 'package:radio_station_player/core/errors/failures.dart';
import 'package:radio_station_player/domain/entities/radio_station.dart';

/// Radio repository interface
abstract class IRadioRepository {
  ///
  Future<Either<Failure, List<RadioStation>>> getRadioStations();
}
