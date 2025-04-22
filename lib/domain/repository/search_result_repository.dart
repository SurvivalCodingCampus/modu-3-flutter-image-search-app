import '../model/photo.dart';

abstract interface class SearchResultRepository {
  Future<void> save(List<Photo> photos);

  Future<List<Photo>> load();
}
