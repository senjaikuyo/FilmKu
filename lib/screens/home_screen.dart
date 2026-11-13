import 'package:flutter/material.dart';
import '../state/app_state.dart';
import 'detail_screen.dart';
import 'watchlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String q = '';

  @override
  Widget build(BuildContext context) {
    final state = AppState.instance;
    return ListenableBuilder(
      listenable: state,
      builder: (context, _) {
        final list = state.movies
            .where((m) => m.title.toLowerCase().contains(q.toLowerCase()))
            .toList();
        final count = state.movies.where((m) => m.isWatchlist).length;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Filmku'),
            actions: [
              IconButton(
                icon: Badge(
                    label: Text('$count'),
                    isLabelVisible: count > 0,
                    child: const Icon(Icons.bookmark_outline)),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const WatchlistScreen())),
              ),
            ],
          ),
          body: Column(children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Cari film...',
                    border: OutlineInputBorder()),
                onChanged: (v) => setState(() => q = v),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (_, i) => ListTile(
                  leading:
                      const Icon(Icons.movie_outlined, color: Colors.white),
                  title: Text(list[i].title),
                  subtitle: Text(list[i].genre,
                      style: const TextStyle(color: Colors.white54)),
                  trailing: Text('⭐ ${list[i].rating}'),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => DetailScreen(movie: list[i]))),
                ),
              ),
            ),
          ]),
        );
      },
    );
  }
}
