import 'package:dio/dio.dart';
import 'package:kode_start_rickandmorty/models/detailed_character.dart';
import 'package:kode_start_rickandmorty/models/episode.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://rickandmortyapi.com/api",
    ),
  );

  Future<List<SeriesCharacter>> fetchAllCharacters() async {
    final response = await _dio.get("/character");
    return (response.data["results"] as List)
        .map((character) => SeriesCharacter.fromJson(character))
        .toList();
  }

  Future<DetailedCharacter> fetchCharacterDetails(int characterId) async {
    final response = await _dio.get("/character/$characterId");
    return DetailedCharacter.fromJson(response.data);
  }

  Future<List<Episode>> fetchAllEpisodes(int page) async {
    final response = await _dio.get("/episode");
    return (response.data["results"] as List)
        .map((episode) => Episode.fromJson(episode))
        .toList();
  }

  Future<EpisodeDetails> fetchEpisodeDetails(int episodeId) async {
    final response = await _dio.get("/episode/$episodeId");
    return EpisodeDetails.fromJson(response.data);
  }
}
