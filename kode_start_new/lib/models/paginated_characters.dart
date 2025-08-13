import 'package:kode_start_rickandmorty/models/detailed_character.dart';

class PaginatedCharacters {
  PaginatedCharacters({
    required this.page,
    required this.results,
    required this.dates,
    required this.totalPages,
    required this.totalResults,
  });
  final int page;
  final List<SeriesCharacter> results;
  final Date dates;
  final int totalPages;
  final int totalResults;

  factory PaginatedCharacters.fromJson(Map<String, dynamic> json) {
    return PaginatedCharacters(
      page: json['page'],
      results: List.from(json['results'])
          .map((e) => SeriesCharacter.fromJson(e))
          .toList(),
      dates: Date.fromJson(json['dates']),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}

class Date {
  Date({
    required this.maximum,
    required this.minimum,
  });
  final String maximum;
  final String minimum;

  factory Date.fromJson(Map<String, dynamic> json) {
    return Date(
      maximum: json['maximum'],
      minimum: json['minimum'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'maximum': maximum,
      'minimum': minimum,
    };
  }
}
