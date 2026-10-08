class Movie {
  final String id;
  final String title;
  final String description;
  final String imagePath;
  final String ageRating;
  final String screeningTime;
  final int runtime;

  const Movie({
    required this.id,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.ageRating,
    required this.screeningTime,
    required this.runtime,
  });
}
