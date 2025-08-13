import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kode_start_rickandmorty/models/episode.dart';
import 'package:kode_start_rickandmorty/services/api_service.dart';

class EpisodeState {
  final List<Episode> episodes;
  final EpisodeDetails? selectedEpisode;
  final bool isLoading;
  final String? error;

  const EpisodeState({
    this.episodes = const [],
    this.selectedEpisode,
    this.isLoading = false,
    this.error,
  });

  EpisodeState copyWith({
    List<Episode>? episodes,
    EpisodeDetails? selectedEpisode,
    bool? isLoading,
    String? error,
  }) {
    return EpisodeState(
      episodes: episodes ?? this.episodes,
      selectedEpisode: selectedEpisode ?? this.selectedEpisode,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class EpisodeViewModel extends StateNotifier<EpisodeState> {
  final ApiService _apiService;

  EpisodeViewModel(this._apiService) : super(const EpisodeState());

  Future<void> fetchAllEpisodes() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final episodes = await _apiService.fetchAllEpisodes(1);
      state = state.copyWith(
        episodes: episodes,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        error: e.toString(),
        isLoading: false,
      );
    }
  }

  Future<void> fetchEpisodeDetails(int episodeId) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final episode = await _apiService.fetchEpisodeDetails(episodeId);
      state = state.copyWith(
        selectedEpisode: episode,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        error: e.toString(),
        isLoading: false,
      );
    }
  }
}

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

final episodeViewModelProvider =
    StateNotifierProvider<EpisodeViewModel, EpisodeState>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return EpisodeViewModel(apiService);
});

final episodesProvider = FutureProvider<List<Episode>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return await apiService.fetchAllEpisodes(1);
});

final episodeDetailsProvider =
    FutureProvider.family<EpisodeDetails, int>((ref, episodeId) async {
  final apiService = ref.watch(apiServiceProvider);
  return await apiService.fetchEpisodeDetails(episodeId);
});
