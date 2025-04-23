import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_search_app/data/data_source/photo_data_source.dart';
import 'package:image_search_app/data/mapper/photo_mapper.dart';
import 'package:image_search_app/domain/model/photo.dart';
import 'package:image_search_app/domain/repository/photo_repository.dart';

import 'mock_photo_repository_impl.dart';

final photoRepositoryProvider = Provider<PhotoRepository>((ref) {
  return MockPhotoRepositoryImpl();
});

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _photoDataSource;

  PhotoRepositoryImpl(this._photoDataSource);

  @override
  Future<List<Photo>> getPhotos(String query) async {
    final dto = await _photoDataSource.getPhotoResultDtoByQuery(query);

    if (dto.hits == null) {
      return [];
    }

    return dto.hits!.map((e) => e.toPhoto()).toList();
  }

  @override
  Future<Photo?> getPhotosById(int id) async {
    final dto = await _photoDataSource.getPhotoResultDtoById(id);

    return dto.hits?.map((e) => e.toPhoto()).firstOrNull;
  }
}
