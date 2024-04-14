// ignore_for_file: avoid_redundant_argument_values, public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_station_player/core/utils/utils_exports.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> with BaseBloc {
  FilterBloc() : super(FilterState()) {
    on<OnToggleFavoriteFilterEvent>((event, emit) {
      secureEmit(
        FilterState(isShowingOnlyFav: event.isShowingOnlyFav),
      );
    });
  }
}
