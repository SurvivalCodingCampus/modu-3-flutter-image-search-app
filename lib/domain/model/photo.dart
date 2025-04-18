import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';

@freezed
class Photo with _$Photo {
  final int id;
  final String imageUrl;
  final String user;
  final String tags;

  const Photo({
    required this.id,
    required this.imageUrl,
    required this.user,
    required this.tags,
  });
}