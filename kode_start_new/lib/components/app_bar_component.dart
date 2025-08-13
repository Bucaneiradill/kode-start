import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kode_start_rickandmorty/view/home_page.dart';
import 'package:kode_start_rickandmorty/theme/app_images.dart';

import '../theme/app_colors.dart';

PreferredSizeWidget appBarComponent(BuildContext context,
    {bool isSecondPage = false}) {
  return AppBar(
    toolbarHeight: kToolbarHeight * 2.2,
    backgroundColor: AppColors.appBarColor,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    leading: Container(
      padding: EdgeInsets.only(left: 8, top: 16),
      child: Align(
        alignment: Alignment.topCenter,
        child: GestureDetector(
          onTap: () {
            final currentRoute = ModalRoute.of(context)?.settings.name;
            if (currentRoute == HomePage.routeId) {}
            ;
            Navigator.pop(context);
          },
          child: Icon(
            isSecondPage ? Icons.arrow_back : Icons.menu,
            color: AppColors.white,
            size: 31.46,
          ),
        ),
      ),
    ),
    actions: [
      Container(
        padding: EdgeInsets.only(right: 8, top: 16),
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(right: 16),
        child: IconButton(
          icon: Icon(
            Icons.account_circle_rounded,
            color: AppColors.white,
            size: 31.46,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/profile', arguments: true);
          },
        ),
      ),
    ],
    flexibleSpace: SafeArea(
      child: Column(
        children: [
          Image.asset(AppImages.logo),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "rick and morty API".toUpperCase(),
              style: GoogleFonts.lato(
                  color: AppColors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.5,
                  letterSpacing: 1.65),
            ),
          ),
        ],
      ),
    ),
  );
}
