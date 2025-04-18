import 'package:image_search_app/domain/model/photo.dart';
import 'package:image_search_app/domain/repository/photo_repository.dart';

class MockPhotoRepositoryImpl implements PhotoRepository {
  @override
  Future<List<Photo>> getPhotos(String query) async {
    await Future.delayed(Duration(seconds: 1));

    if (query.isEmpty) {
      return [];
    }

    if (query == '111') {
      throw Exception('부정한 단어 입력');
    }

    return _mockResults;
  }

  @override
  Future<Photo?> getPhotosById(int id) async {
    if (id == 0) {
      return Photo(
        id: 0,
        imageUrl:
            'https://cdn.pixabay.com/photo/2016/04/30/21/45/tulips-1364024_150.jpg',
        user: '홍길동',
        tags: 'tulips, yellow',
      );
    } else {
      throw Exception('잘못된 id');
    }
  }
}

final _mockResults = [
  Photo(
    id: 0,
    imageUrl:
        'https://cdn.pixabay.com/photo/2016/04/30/21/45/tulips-1364024_150.jpg',
    user: '홍길동',
    tags: 'tulips, yellow',
  ),
  Photo(
    id: 1,
    imageUrl:
        'https://cdn.pixabay.com/photo/2023/10/01/16/01/rose-8287698_150.jpg',
    user: '홍길동2',
    tags: 'tulips, yellow2',
  ),
  Photo(
    id: 2,
    imageUrl:
        'https://cdn.pixabay.com/photo/2022/07/24/09/32/flower-7341288_150.jpg',
    user: '홍길동3',
    tags: 'tulips, yellow3',
  ),
];
