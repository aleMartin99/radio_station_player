import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';

import 'package:radio_station_player/core/errors/failures.dart';
import 'package:radio_station_player/core/utils/base_bloc.dart';
import 'package:radio_station_player/core/utils/no_params.dart';
import 'package:radio_station_player/domain/entities/radio_station.dart';
import 'package:radio_station_player/domain/usecases/get_radio_stations/get_radio_stations_usecase.dart';

part 'radio_station_event.dart';
part 'radio_station_state.dart';
part 'radio_station_status.dart';

/// RadioStationBloc class
class RadioStationBloc extends Bloc<RadioStationEvent, RadioStationState>
    with BaseBloc {
  ///
  RadioStationBloc({required this.getRadioStationsUsecase})
      : super(const RadioStationState()) {
    on<OnLoadRadioStationsEvent>((event, emit) async {
      emit(state.copyWith(status: RadioStationStatus.loading));

      /// call the usecase instance
      final responseGetPopularMovies =
          await getRadioStationsUsecase(NoParams());
      if (responseGetPopularMovies.isRight()) {
        final popularMovies =
            (responseGetPopularMovies as Right).value as List<RadioStation>?;

        secureEmit(
          state.copyWith(
            status: RadioStationStatus.success,
            radioStationsList: popularMovies,
          ),
        );
      } else {
        final failure = (responseGetPopularMovies as Left).value as Failure;
        secureEmit(
          state.copyWith(
            failure: failure.message,
            status: RadioStationStatus.failure,
          ),
        );
      }
    });
  }

  ///
  final GetRadioStationsUsecase getRadioStationsUsecase;
}
