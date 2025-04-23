import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/data_source/photo_data_source.dart';
import '../../data/data_source/pixabay_api.dart';
import '../../data/repository/mock_photo_repository_impl.dart';
import '../../data/repository/mock_search_result_repository_impl.dart';
import '../../domain/repository/photo_repository.dart';
import '../../domain/repository/search_result_repository.dart';
import '../../domain/use_case/search_photo_use_case.dart';
import '../../domain/use_case/search_photos_use_case.dart';
import '../../presentation/detail/detail_view_model.dart';

final photoRepositoryProvider = Provider<PhotoRepository>((ref) {
  return MockPhotoRepositoryImpl();
});

final searchResultRepositoryProvider = Provider<SearchResultRepository>((ref) {
  return MockSearchResultRepositoryImpl();
});

final searchPhotoUseCaseProvider = Provider<SearchPhotoUseCase>((ref) {
  return SearchPhotoUseCase(ref.read(photoRepositoryProvider));
});

final searchPhotosUseCaseProvider = Provider<SearchPhotosUseCase>((ref) {
  return SearchPhotosUseCase(
    photoRepository: ref.read(photoRepositoryProvider),
    searchResultRepository: ref.read(searchResultRepositoryProvider),
  );
});

final photoDataSourceProvider = Provider<PhotoDataSource>((ref) {
  return PixabayApi();
});

final detailViewModelProvider = ChangeNotifierProvider<DetailViewModel>((ref) {
  return DetailViewModel(ref.read(searchPhotoUseCaseProvider));
});
