import 'package:flutter_test/flutter_test.dart';
import 'package:flicklog/main.dart';

void main() {
  testWidgets('Smoke test FilmkuApp', (WidgetTester tester) async {
    await tester.pumpWidget(const FilmkuApp());
    expect(find.text('FILMKU'), findsOneWidget);
    // Jalankan timer splash 2 detik sampai selesai
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();
    expect(find.text('Masuk'), findsOneWidget);
  });
}
