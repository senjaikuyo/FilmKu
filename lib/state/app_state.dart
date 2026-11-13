import 'package:flutter/material.dart';
import '../models/movie.dart';

class AppState extends ChangeNotifier {
  static final instance = AppState();

  final List<Movie> movies = [
    Movie(1, 'Inception', 'Sci-Fi', 8.8, 'Pencuri menyusup mimpi target.', reviews: ['Keren']),
    Movie(2, 'Interstellar', 'Sci-Fi', 8.7, 'Misi astronaut cari planet baru.', reviews: ['Epik']),
    Movie(3, 'The Dark Knight', 'Action', 9.0, 'Batman vs Joker di Gotham.', reviews: ['Mantap']),
  ];

  void toggleWatch(Movie m) {
    m.isWatchlist = !m.isWatchlist;
    notifyListeners();
  }

  void addReview(Movie m, String text) {
    m.reviews.add(text);
    notifyListeners();
  }
}
