import 'package:image_search_app/core/result.dart';
import 'package:image_search_app/domain/model/photo.dart';
import 'package:image_search_app/domain/repository/photo_repository.dart';

class SearchPhotosUseCase {
  final PhotoRepository _photoRepository;

  SearchPhotosUseCase(this._photoRepository);

  Future<Result<List<Photo>>> execute(String query) async {
    try {
      final results = await _photoRepository.getPhotos(query);
      return Result.success(results);
    } catch (e) {
      return Result.error(Exception('알 수 없는 에러'));
    }
  }
}
