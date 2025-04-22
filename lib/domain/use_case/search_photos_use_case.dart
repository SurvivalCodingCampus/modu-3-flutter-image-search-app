import 'package:image_search_app/core/result.dart';
import 'package:image_search_app/domain/model/photo.dart';
import 'package:image_search_app/domain/repository/photo_repository.dart';
import 'package:image_search_app/domain/repository/search_result_repository.dart';

class SearchPhotosUseCase {
  final PhotoRepository _photoRepository;
  final SearchResultRepository _searchResultRepository;

  const SearchPhotosUseCase({
    required PhotoRepository photoRepository,
    required SearchResultRepository searchResultRepository,
  }) : _photoRepository = photoRepository,
       _searchResultRepository = searchResultRepository;

  Future<Result<List<Photo>>> execute(String query) async {
    try {
      final savedPhotos = await _searchResultRepository.load();
      print(savedPhotos);

      final results = await _photoRepository.getPhotos(query);

      await _searchResultRepository.save(results);

      return Result.success(results.take(2).toList());
    } catch (e) {
      return Result.error(Exception('알 수 없는 에러'));
    }
  }
}
