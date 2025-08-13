import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kode_start_rickandmorty/components/app_bar_component.dart';
import 'package:kode_start_rickandmorty/components/detailed_character_card.dart';
import 'package:kode_start_rickandmorty/theme/app_colors.dart';

class ProfilePage extends ConsumerWidget {
  static const routeId = '/profile';
  final bool profile;
  const ProfilePage({required this.profile, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarComponent(context, isSecondPage: true),
        backgroundColor: AppColors.backgroundColor,
        body: DetailedCardWidget(characterId: 0, profile: profile),
      ),
    );
  }
}
