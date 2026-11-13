import 'package:flutter/material.dart';
import '../state/app_state.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppState.instance;
    return ListenableBuilder(
      listenable: state,
      builder: (context, _) {
        final list = state.movies.where((m) => m.isWatchlist).toList();
        return Scaffold(
          appBar: AppBar(title: const Text('Watchlist')),
          body: list.isEmpty
              ? const Center(
                  child:
                      Text('Kosong.', style: TextStyle(color: Colors.white54)))
              : ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (_, i) => ListTile(
                    title: Text(list[i].title),
                    subtitle: Text(list[i].genre,
                        style: const TextStyle(color: Colors.white54)),
                    trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => state.toggleWatch(list[i])),
                  ),
                ),
        );
      },
    );
  }
}
