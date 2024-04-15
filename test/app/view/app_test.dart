import 'package:flutter_riverpod_firebase/src/app/app.dart';
import 'package:flutter_riverpod_firebase/src/feature/feature.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(TodoPage), findsOneWidget);
    });
  });
}
