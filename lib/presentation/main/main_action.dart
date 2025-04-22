import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/photo.dart';

part 'main_action.freezed.dart';

@freezed
sealed class MainAction with _$MainAction {
  const factory MainAction.onSearch(String query) = OnSearch;
  const factory MainAction.onTapPhoto(Photo photo) = OnTapPhoto;
}

