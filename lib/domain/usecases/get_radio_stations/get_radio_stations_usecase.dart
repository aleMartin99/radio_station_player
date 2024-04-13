import 'package:fpdart/fpdart.dart';
import 'package:radio_station_player/core/errors/failures.dart';
import 'package:radio_station_player/core/utils/no_params.dart';
import 'package:radio_station_player/core/utils/use_case.dart';
import 'package:radio_station_player/domain/entities/radio_station.dart';

/// GetRadioStationsUsecase class
class GetRadioStationsUsecase extends UseCase<List<RadioStation>, NoParams> {
  ///
  GetRadioStationsUsecase({required this.getRadioStations});

  /// getRadioStations function
  final Future<Either<Failure, List<RadioStation>>> Function() getRadioStations;

  @override
  Future<Either<Failure, List<RadioStation>>> call(NoParams params) =>
      getRadioStations();
}
