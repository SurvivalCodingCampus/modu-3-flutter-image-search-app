import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_search_app/domain/model/photo.dart';

part 'main_state.freezed.dart';

@freezed
class MainState with _$MainState {
  final List<Photo> photos;
  final bool isLoading;

  const MainState({
    this.photos = const [],
    this.isLoading = false,
  });
}