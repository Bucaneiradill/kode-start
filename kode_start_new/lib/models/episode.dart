class Episode {
  Episode({
    required this.id,
    required this.name,
    required this.image,
  });
  final int id;
  final String name;
  final String image;

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      id: json['id'],
      name: json['name'],
      image: json['url'] ?? '',
    );
  }
}

class EpisodeDetails extends Episode {
  EpisodeDetails({
    required super.id,
    required super.name,
    required super.image,
    required this.airDate,
    required this.episode,
    required this.url,
  });

  final String airDate;
  final String episode;
  final String? url;

  factory EpisodeDetails.fromJson(Map<String, dynamic> json) {
    return EpisodeDetails(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      airDate: json['air_date'],
      episode: json['episode'],
      url: json['url'],
    );
  }
}
