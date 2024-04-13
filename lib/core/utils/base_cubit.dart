import 'package:flutter_bloc/flutter_bloc.dart';

/// Base cubit for app's cubits.
mixin BaseCubit<State> on Cubit<State> {
  /// Method that guarantee a new state should be
  /// emitted only if the cubit has not been closed.
  void secureEmit(State newState) {
    if (!isClosed) {
      emit(newState);
    }
  }
}
