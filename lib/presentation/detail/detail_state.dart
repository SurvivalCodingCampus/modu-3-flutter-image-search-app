import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_search_app/domain/model/photo.dart';

part 'detail_state.freezed.dart';

@freezed
class DetailState with _$DetailState {
  final Photo? photo;
  final bool isLoading;

  const DetailState({this.photo, this.isLoading = false});
}
