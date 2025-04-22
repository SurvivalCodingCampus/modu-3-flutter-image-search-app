import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_search_app/domain/model/photo.dart';
import 'package:image_search_app/presentation/main/main_screen.dart';
import 'package:image_search_app/presentation/main/main_state.dart';

void main() {
  testWidgets('MainScreen', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MainScreen(
          state: MainState(isLoading: true),
          onSearch: (String query) {},
          onTapPhoto: (Photo photo) {},
        ),
      ),
    );

    final loading = find.byKey(ValueKey('Loading'));
    expect(loading, findsOneWidget);
  });
}
