class Media {
  String title;
  String type;
  String description;
  double rating;
  String releaseDate;
  String image;
  String video;
  List<String> genre;
  List<String> cast;
  String director;
  String duration;
  String ageRating;

  Media({
    required this.title,
    required this.type,
    required this.description,
    required this.rating,
    required this.releaseDate,
    required this.image,
    required this.video,
    required this.genre,
    required this.cast,
    required this.director,
    required this.duration,
    required this.ageRating,
  });

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      title: json['title'],
      type: json['type'],
      description: json['description'],
      rating: json['rating'].toDouble(),
      releaseDate: json['releaseDate'],
      image: json['image'],
      video: json['video'],
      genre: List<String>.from(json['genre']),
      cast: List<String>.from(json['cast']),
      director: json['director'],
      duration: json['duration'],
      ageRating: json['ageRating'],
    );
  }
}