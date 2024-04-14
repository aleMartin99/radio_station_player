// ignore_for_file: unnecessary_lambdas

import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:radio_station_player/data/datasources/datasource_exports.dart';
import 'package:radio_station_player/data/repositories/radio_repository.dart';
import 'package:radio_station_player/domain/repositories/iradio_repository.dart';
import 'package:radio_station_player/domain/usecases/get_radio_stations/get_radio_stations_usecase.dart';
import 'package:radio_station_player/presentation/home_screen/filter_bloc/filter_bloc.dart';
import 'package:radio_station_player/presentation/home_screen/radio_station_bloc/radio_station_bloc.dart';
import 'package:radio_station_player/presentation/player_screen/player_cubit/player_cubit.dart';

//Favors Dependency inversion and single responsibility principles

/// Initialize the app's core
FutureOr<void> initCore(GetIt sl) async {
  sl
    ..registerLazySingleton<IRadioDatasource>(
      () => RadioDatasource(),
    )
    ..registerLazySingleton<IRadioRepository>(
      () => RadioRepository(
        sl<IRadioDatasource>(),
      ),
    )
    ..registerLazySingleton<GetRadioStationsUsecase>(
      () => GetRadioStationsUsecase(
        getRadioStations: sl<IRadioRepository>().getRadioStations,
      ),
    )
    ..registerLazySingleton<RadioStationBloc>(
      () => RadioStationBloc(
        getRadioStationsUsecase: sl<GetRadioStationsUsecase>(),
      ),
    )
    ..registerLazySingleton<PlayerCubit>(
      () => PlayerCubit(),
    )
    ..registerLazySingleton<FilterBloc>(
      () => FilterBloc(),
    );
}
