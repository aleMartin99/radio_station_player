// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter_bloc/flutter_bloc.dart';

/// Base bloc for app's blocs.
mixin BaseBloc<Event, State> on Bloc<Event, State> {
  /// Method that guarantee a new state should be
  /// emitted only if the bloc has not been closed.
  void secureEmit(State newState) {
    if (!isClosed) {
      emit(newState);
    }
  }
}
