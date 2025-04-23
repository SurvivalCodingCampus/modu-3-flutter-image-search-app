import 'package:image_search_app/domain/model/photo.dart';
import 'package:image_search_app/domain/repository/search_result_repository.dart';

class MockSearchResultRepositoryImpl implements SearchResultRepository {
  final _memory = <Photo>[];

  @override
  Future<List<Photo>> load() async {
    return _memory;
  }

  @override
  Future<void> save(List<Photo> photos) async {
    _memory.clear();
    _memory.addAll(photos);
  }
}
