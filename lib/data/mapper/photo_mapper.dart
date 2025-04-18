import 'package:image_search_app/data/dto/photo_result_dto.dart';

import '../../domain/model/photo.dart';

extension PhotoMapper on PhotoDto {
  Photo toPhoto() {
    return Photo(
      id: id!.toInt(),
      imageUrl: previewURL!,
      user: user!,
      tags: tags!,
    );
  }
}
