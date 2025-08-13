import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kode_start_rickandmorty/components/character_card.dart';
import 'package:kode_start_rickandmorty/provider/character_view_model.dart';
import 'package:kode_start_rickandmorty/provider/episode_view_model.dart';
import 'package:kode_start_rickandmorty/theme/app_colors.dart';

enum ScreenInfo { characters, episodes }

class ListViewWidget extends ConsumerWidget {
  final ScreenInfo screenInfo;
  const ListViewWidget({super.key, required this.screenInfo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<dynamic>> apiAsync;
    if (screenInfo == ScreenInfo.characters) {
      apiAsync = ref.watch(charactersProvider);
    } else {
      apiAsync = ref.watch(episodesProvider);
    }

    return apiAsync.when(
      data: (data) {
        FlutterNativeSplash.remove();
        return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];
              return CardWidget(
                item: item,
                onTap: () {
                  Navigator.of(context)
                      .pushNamed('/details', arguments: item.id);
                },
              );
            });
      },
      error: (error, stack) {
        return Center(
          child: Text(
            "Ocorreu um erro.",
            style: TextStyle(color: AppColors.white),
          ),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
