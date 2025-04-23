import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_search_app/presentation/main/main_screen.dart';
import 'package:image_search_app/presentation/main/main_view_model.dart';

import '../../core/routing/routes.dart';
import 'main_action.dart';

class MainScreenRoot extends ConsumerStatefulWidget {
  const MainScreenRoot({super.key});

  @override
  ConsumerState<MainScreenRoot> createState() => _MainScreenRootState();
}

class _MainScreenRootState extends ConsumerState<MainScreenRoot> {

  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();
    // _subscription = viewModel.eventStream.listen((event) {
    //   if (mounted) {
    //     switch (event) {
    //       case ShowSnackbar():
    //         final snackBar = SnackBar(content: Text(event.message));
    //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //     }
    //   }
    // });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(mainViewModelProvider.notifier);
    final state = ref.watch(mainViewModelProvider);
    return MainScreen(
      state: state,
      onAction: (MainAction action) {
        switch (action) {
          case OnSearch():
            viewModel.search(action.query);
          case OnTapPhoto():
            context.push(Routes.mainWithId(action.photo.id));
        }
      },
    );
  }
}
