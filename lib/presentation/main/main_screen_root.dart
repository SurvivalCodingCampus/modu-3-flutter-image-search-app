import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_search_app/core/presentation/one_time_event_mixin.dart';
import 'package:image_search_app/presentation/main/main_event.dart';
import 'package:image_search_app/presentation/main/main_screen.dart';
import 'package:image_search_app/presentation/main/main_state.dart';
import 'package:image_search_app/presentation/main/main_view_model.dart';

import '../../core/routing/routes.dart';
import 'main_action.dart';

class MainScreenRoot extends StatefulWidget {
  final MainViewModel viewModel;

  const MainScreenRoot({super.key, required this.viewModel});

  @override
  State<MainScreenRoot> createState() => _MainScreenRootState();
}

class _MainScreenRootState extends State<MainScreenRoot>
    with OneTimeEventMixin {
  MainViewModel get viewModel => widget.viewModel;

  MainState get state => widget.viewModel.state;

  @override
  void initState() {
    super.initState();

    listenEvent<MainEvent>(viewModel.eventStream, (event) {
      switch (event) {
        case ShowSnackbar(:final message):
          final snackBar = SnackBar(content: Text(message));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (_, _) {
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
      },
    );
  }
}
