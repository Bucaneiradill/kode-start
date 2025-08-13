import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kode_start_rickandmorty/services/api_service.dart';
import 'package:kode_start_rickandmorty/models/detailed_character.dart';

class CharacterState {
  final List<SeriesCharacter> characters;
  final DetailedCharacter? selectedCharacter;
  final bool isLoading;
  final String? error;

  const CharacterState({
    this.characters = const [],
    this.selectedCharacter,
    this.isLoading = false,
    this.error,
  });

  CharacterState copyWith({
    List<SeriesCharacter>? characters,
    DetailedCharacter? selectedCharacter,
    bool? isLoading,
    String? error,
  }) {
    return CharacterState(
      characters: characters ?? this.characters,
      selectedCharacter: selectedCharacter ?? this.selectedCharacter,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class CharacterViewModel extends StateNotifier<CharacterState> {
  final ApiService _apiService;

  CharacterViewModel(this._apiService) : super(const CharacterState());

  Future<void> fetchAllCharacters() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final characters = await _apiService.fetchAllCharacters();
      state = state.copyWith(
        characters: characters,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        error: e.toString(),
        isLoading: false,
      );
    }
  }

  Future<void> fetchCharacterDetails(int characterId) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final character = await _apiService.fetchCharacterDetails(characterId);
      state = state.copyWith(
        selectedCharacter: character,
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

final characterViewModelProvider =
    StateNotifierProvider<CharacterViewModel, CharacterState>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return CharacterViewModel(apiService);
});

final charactersProvider = FutureProvider<List<SeriesCharacter>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return await apiService.fetchAllCharacters();
});

final characterDetailsProvider =
    FutureProvider.family<DetailedCharacter, int>((ref, characterId) async {
  final apiService = ref.watch(apiServiceProvider);
  return await apiService.fetchCharacterDetails(characterId);
});
