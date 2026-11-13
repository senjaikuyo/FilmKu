class Movie {
  final int id;
  final String title, genre, desc;
  final double rating;
  bool isWatchlist;
  List<String> reviews;

  Movie(this.id, this.title, this.genre, this.rating, this.desc,
      {this.isWatchlist = false, List<String>? reviews})
      : reviews = reviews ?? [];
}
