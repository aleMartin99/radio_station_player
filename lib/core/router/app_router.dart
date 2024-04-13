// ignore_for_file: public_member_api_docs

//TODO get exports files for each page
import 'package:flutter/material.dart';
import 'package:radio_station_player/domain/entities/radio_station.dart';
import 'package:radio_station_player/presentation/home_screen/home_screen.dart';
import 'package:radio_station_player/presentation/player_screen/player_screen.dart';
import 'package:radio_station_player/presentation/splash_screen/splash_screen.dart';

/// key to access splash screen route
const String splashScreenRoute = '/splash';

/// key to compare home screen route
const String homeScreenRoute = '/home';

/// key to compare player screen route
const String playerScreenRoute = '/player';

class AppRouter extends StatelessWidget {
  const AppRouter({super.key});

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case splashScreenRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case homeScreenRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case playerScreenRoute:
        if (args is PlayerArguments) {
          return MaterialPageRoute(
            builder: (_) => PlayerScreen(
              radioStation: args.radioStation,
            ),
          );
        } else {
          return _errorRoute();
        }

      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(
    builder: (_) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Error'),
        ),
      );
    },
  );
}

class PlayerArguments {
  const PlayerArguments(
    this.radioStation,
  );
  final RadioStation radioStation;
}
