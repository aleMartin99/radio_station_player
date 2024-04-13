// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_station_player/core/router/app_router.dart';
import 'package:radio_station_player/core/router/routes.dart';
import 'package:radio_station_player/core/theme/themes.dart';
import 'package:radio_station_player/main.dart';
import 'package:radio_station_player/presentation/home_screen/radio_station_bloc/radio_station_bloc.dart';
import 'package:radio_station_player/presentation/player_screen/player_cubit/player_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
//TODO exports file

/// Base class for the application

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      if (state == AppLifecycleState.detached) {
        dispose();
      }
    });
    super.didChangeDependencies();
  }

  // @override
  // void dispose() {
  //   WidgetsBinding.instance.removeObserver(this);
  //   //TODO add player dispose method
  //   // pageManager.dispose();
  //   super.dispose();
  // }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

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
            //TODO add in sl app blocprovider
            BlocProvider(
              create: (context) => PlayerCubit(),
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
