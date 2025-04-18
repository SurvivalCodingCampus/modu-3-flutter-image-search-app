import 'package:go_router/go_router.dart';
import 'package:image_search_app/core/routing/routes.dart';
import 'package:image_search_app/data/data_source/pixabay_api.dart';
import 'package:image_search_app/domain/use_case/search_photo_use_case.dart';
import 'package:image_search_app/presentation/detail/detail_screen.dart';
import 'package:image_search_app/presentation/detail/detail_view_model.dart';
import 'package:image_search_app/presentation/main/main_screen.dart';

import '../../data/repository/photo_repository_impl.dart';
import '../../domain/model/photo.dart';
import '../../domain/use_case/search_photos_use_case.dart';
import '../../presentation/main/main_view_model.dart';
import '../di/di_setup.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: Routes.main,
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
      routes: [
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final id = int.parse(state.pathParameters['id']!);
            final DetailViewModel viewModel = getIt();
            viewModel.fetchPhoto(id);

            return DetailScreen(viewModel: viewModel);
          },
        ),
      ],
    ),
  ],
);
