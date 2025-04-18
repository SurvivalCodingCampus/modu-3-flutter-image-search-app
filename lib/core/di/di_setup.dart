import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:image_search_app/data/data_source/photo_data_source.dart';

import '../../data/data_source/pixabay_api.dart';
import '../../data/repository/mock_photo_repository_impl.dart';
import '../../data/repository/photo_repository_impl.dart';
import '../../domain/repository/photo_repository.dart';
import '../../domain/use_case/search_photo_use_case.dart';
import '../../domain/use_case/search_photos_use_case.dart';
import '../../presentation/detail/detail_view_model.dart';
import '../../presentation/main/main_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton(PixabayApi() as PhotoDataSource);
  getIt.registerSingleton<PhotoRepository>(PhotoRepositoryImpl(getIt()));
  getIt.registerSingleton(SearchPhotosUseCase(getIt()));
  getIt.registerSingleton(SearchPhotoUseCase(getIt()));

  getIt.registerFactory(() => MainViewModel(searchPhotosUseCase: getIt()));
  getIt.registerFactory(() => DetailViewModel(getIt()));
}

void mockDiSetup() {
  getIt.registerSingleton<PhotoRepository>(MockPhotoRepositoryImpl());
  getIt.registerSingleton(SearchPhotosUseCase(getIt()));
  getIt.registerSingleton(SearchPhotoUseCase(getIt()));

  getIt.registerFactory(() => MainViewModel(searchPhotosUseCase: getIt()));
  getIt.registerFactory(() => DetailViewModel(getIt()));
}
