import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_event.freezed.dart';

@freezed
sealed class MainEvent with _$MainEvent {
  const factory MainEvent.showSnackbar(String message) = ShowSnackbar;
}

