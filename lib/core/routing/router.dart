import 'package:go_router/go_router.dart';
import 'package:image_search_app/core/routing/routes.dart';
import 'package:image_search_app/presentation/detail/detail_screen.dart';
import 'package:image_search_app/presentation/detail/detail_view_model.dart';
import 'package:image_search_app/presentation/main/main_screen.dart';

import '../../domain/model/photo.dart';
import '../di/di_setup.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: Routes.main,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (
        context,
        GoRouterState state,
        StatefulNavigationShell navigationShell,
      ) {
        return navigationShell;
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.main,
              builder:
                  (context, state) => MainScreen(
                    viewModel: getIt(),
                    onTapPhoto: (Photo photo) {
                      context.push(Routes.mainWithId(photo.id));
                    },
                  ),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '${Routes.main}/:id',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        final DetailViewModel viewModel = getIt();
        viewModel.fetchPhoto(id);

        return DetailScreen(viewModel: viewModel);
      },
    ),
  ],
);
