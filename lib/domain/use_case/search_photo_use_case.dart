import 'package:image_search_app/domain/repository/photo_repository.dart';

import '../../core/result.dart';
import '../model/photo.dart';

class SearchPhotoUseCase {
  final PhotoRepository _photoRepository;

  SearchPhotoUseCase(this._photoRepository);

  Future<Result<Photo>> execute(int id) async {
    try {
      final photo = await _photoRepository.getPhotosById(id);
      if (photo == null) {
        return Result.error(Exception('잘못된 id 입니다'));
      }
      return Result.success(photo);
    } catch (e) {
      return Result.error(Exception('알 수 없은 에러'));
    }
  }
}
