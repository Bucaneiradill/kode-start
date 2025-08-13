import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kode_start_rickandmorty/components/app_bar_component.dart';
import 'package:kode_start_rickandmorty/components/detailed_character_card.dart';
import 'package:kode_start_rickandmorty/theme/app_colors.dart';

class DetailsPage extends ConsumerWidget {
  static const routeId = '/details';
  const DetailsPage({required this.characterId, super.key});
  final int characterId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarComponent(context, isSecondPage: true),
        backgroundColor: AppColors.backgroundColor,
        body: DetailedCardWidget(characterId: characterId),
      ),
    );
  }
}
