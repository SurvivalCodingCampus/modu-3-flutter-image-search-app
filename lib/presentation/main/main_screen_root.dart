import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_search_app/presentation/main/main_event.dart';
import 'package:image_search_app/presentation/main/main_screen.dart';
import 'package:image_search_app/presentation/main/main_state.dart';
import 'package:image_search_app/presentation/main/main_view_model.dart';

import '../../core/routing/routes.dart';

class MainScreenRoot extends StatefulWidget {
  final MainViewModel viewModel;

  const MainScreenRoot({super.key, required this.viewModel});

  @override
  State<MainScreenRoot> createState() => _MainScreenRootState();
}

class _MainScreenRootState extends State<MainScreenRoot> {
  MainViewModel get viewModel => widget.viewModel;

  MainState get state => widget.viewModel.state;

  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = viewModel.eventStream.listen((event) {
      if (mounted) {
        switch (event) {
          case ShowSnackbar():
            final snackBar = SnackBar(content: Text(event.message));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (_, _) {
        return MainScreen(
          state: state,
          onSearch: viewModel.search,
          onTapPhoto: (photo) {
            context.push(Routes.mainWithId(photo.id));
          },
        );
      },
    );
  }
}
