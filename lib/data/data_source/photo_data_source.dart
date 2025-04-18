import 'package:image_search_app/data/dto/photo_result_dto.dart';

abstract interface class PhotoDataSource {
  Future<PhotoResultDto> getPhotoResultDtoByQuery(String query);

  Future<PhotoResultDto> getPhotoResultDtoById(int id);
}
