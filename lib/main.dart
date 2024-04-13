import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:radio_station_player/app.dart';
import 'package:radio_station_player/core/injection_container/init_core.dart';

/// Service locator instance
final sl = GetIt.I;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize all dependencies with the given GetIt service locator as sl
  await initCore(sl);
  runApp(const App());
}
