import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:radio_station_player/core/errors/failures.dart';
import 'package:radio_station_player/core/utils/base_bloc.dart';
import 'package:radio_station_player/core/utils/no_params.dart';
import 'package:radio_station_player/domain/entities/radio_station.dart';
import 'package:radio_station_player/domain/usecases/get_radio_stations/get_radio_stations_usecase.dart';
import 'package:share_plus/share_plus.dart';

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
      final responseGetRadioStations =
          await getRadioStationsUsecase(NoParams());
      if (responseGetRadioStations.isRight()) {
        final radioStations =
            (responseGetRadioStations as Right).value as List<RadioStation>?;

        secureEmit(
          state.copyWith(
            status: RadioStationStatus.success,
            radioStationsList: radioStations,
          ),
        );
      } else {
        final failure = (responseGetRadioStations as Left).value as Failure;
        secureEmit(
          state.copyWith(
            failure: failure.message,
            status: RadioStationStatus.failure,
          ),
        );
      }
    });

    on<OnShareRadioStationEvent>((event, emit) async {
      emit(state.copyWith(status: RadioStationStatus.loading));

      await Share.share(
        '''Listen to this cool radio station: ${event.radioStation.name} ${event.radioStation.url}''',
      );
      secureEmit(
        state.copyWith(
          status: RadioStationStatus.sharedRadioStation,
        ),
      );
    });
  }

  ///
  final GetRadioStationsUsecase getRadioStationsUsecase;
}
