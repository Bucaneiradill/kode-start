import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kode_start_rickandmorty/theme/screen_info.dart';
import 'package:kode_start_rickandmorty/view/profile_page.dart';

import 'view/details_page.dart';
import 'view/home_page.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const ProviderScope(child: RickandmortyApp()));
}

class RickandmortyApp extends StatelessWidget {
  const RickandmortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case HomePage.routeId:
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => HomePage(
                screenInfo: AppScreens.characters,
              ),
            );
          case DetailsPage.routeId:
            int characterId = settings.arguments as int;
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => DetailsPage(characterId: characterId),
            );
          case ProfilePage.routeId:
            bool profile = settings.arguments as bool;
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => ProfilePage(profile: profile),
            );
          default:
            return null;
        }
      },
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
