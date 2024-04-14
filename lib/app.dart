// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_station_player/core/router/router_exports.dart';
import 'package:radio_station_player/core/theme/theme_exports.dart';
import 'package:radio_station_player/main.dart';
import 'package:radio_station_player/presentation/home_screen/filter_bloc/filter_bloc.dart';
import 'package:radio_station_player/presentation/home_screen/radio_station_bloc/radio_station_bloc.dart';
import 'package:radio_station_player/presentation/player_screen/player_cubit/player_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

/// Base class for the application

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    //initialize responsive sizer package
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => sl<RadioStationBloc>(),
            ),
            BlocProvider(
              create: (context) => sl<PlayerCubit>(),
            ),
            BlocProvider(
              create: (context) => sl<FilterBloc>(),
            ),
          ],
          child: MaterialApp(
            theme: AppThemes.getLightTheme(),
            debugShowCheckedModeBanner: false,
            home: const AppRouter(),
            onGenerateRoute: AppRouter.generateRoute,
            initialRoute: AppRoutes.splashScreenRoute,
          ),
        );
      },
    );
  }
}
