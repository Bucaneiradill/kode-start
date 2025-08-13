// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kode_start_rickandmorty/components/app_bar_component.dart';
import 'package:kode_start_rickandmorty/components/list_view_Widget.dart';
import 'package:kode_start_rickandmorty/theme/app_colors.dart';
import 'package:kode_start_rickandmorty/theme/screen_info.dart';

class HomePage extends ConsumerWidget {
  static const routeId = '/';
  ScreenInfo screenInfo;
  HomePage({super.key, this.screenInfo = AppScreens.characters});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarComponent(context),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: AppColors.primaryColorLight,
                ),
                child: Text(
                  'Rick and Morty',
                  style: GoogleFonts.lato(
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Episodes',
                  style: GoogleFonts.lato(
                    color: AppColors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                onTap: () {
                  screenInfo = AppScreens.episodes;
                  Navigator.of(context)
                      .pushNamed(HomePage.routeId, arguments: screenInfo);
                },
              ),
              ListTile(
                title: Text(
                  'Characters',
                  style: GoogleFonts.lato(
                    color: AppColors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                onTap: () {
                  screenInfo = AppScreens.characters;
                  Navigator.of(context)
                      .pushNamed(HomePage.routeId, arguments: screenInfo);
                },
              ),
            ],
          ),
        ),
        backgroundColor: AppColors.backgroundColor,
        body: ListViewWidget(screenInfo: screenInfo),
      ),
    );
  }
}
