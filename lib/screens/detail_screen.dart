import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../state/app_state.dart';

class DetailScreen extends StatefulWidget {
  final Movie movie;
  const DetailScreen({super.key, required this.movie});
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final rev = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final m = widget.movie;
    final state = AppState.instance;
    return ListenableBuilder(
      listenable: state,
      builder: (context, _) => Scaffold(
        appBar: AppBar(title: Text(m.title)),
        body: ListView(padding: const EdgeInsets.all(16), children: [
          Text('${m.genre} • ⭐ ${m.rating}',
              style: const TextStyle(color: Colors.white54)),
          const SizedBox(height: 10),
          Text(m.desc, style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                backgroundColor: m.isWatchlist ? Colors.red : Colors.white,
                foregroundColor: m.isWatchlist ? Colors.white : Colors.black),
            onPressed: () => state.toggleWatch(m),
            icon: Icon(
                m.isWatchlist ? Icons.bookmark_remove : Icons.bookmark_add),
            label: Text(m.isWatchlist
                ? 'Hapus dari Watchlist'
                : 'Simpan ke Watchlist'),
          ),
          const SizedBox(height: 20),
          const Text('Review',
              style: TextStyle(fontWeight: FontWeight.bold)),
          ...m.reviews.map((r) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text('• $r'))),
          const SizedBox(height: 10),
          Row(children: [
            Expanded(
                child: TextField(
                    controller: rev,
                    decoration: const InputDecoration(
                        hintText: 'Tulis review...',
                        border: OutlineInputBorder()))),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                if (rev.text.isEmpty) return;
                state.addReview(m, rev.text);
                rev.clear();
              },
            ),
          ]),
        ]),
      ),
    );
  }
}
