import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_search_app/presentation/main/main_action.dart';
import 'package:image_search_app/presentation/main/main_screen.dart';
import 'package:image_search_app/presentation/main/main_state.dart';

void main() {
  testWidgets('MainScreen', (WidgetTester tester) async {
    MainAction? action;

    await tester.pumpWidget(
      MaterialApp(
        home: MainScreen(
          state: MainState(isLoading: true),
          onAction: (MainAction mainAction) {
            action = mainAction;
          },
        ),
      ),
    );

    final loading = find.byKey(ValueKey('Loading'));
    expect(loading, findsOneWidget);

    final expectedAction = const MainAction.onSearch('');
    // 찾아서 누르는 코드
    final searchIcon = find.byKey(ValueKey('searchIcon'));
    await tester.tap(searchIcon);

    expect(action, expectedAction);
  });
}
