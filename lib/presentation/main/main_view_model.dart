import 'dart:async';

import 'package:image_search_app/core/result.dart';
import 'package:image_search_app/domain/model/photo.dart';
import 'package:image_search_app/domain/use_case/search_photos_use_case.dart';
import 'package:image_search_app/presentation/main/main_event.dart';
import 'package:image_search_app/presentation/main/main_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main_view_model.g.dart';

@riverpod
class MainViewModel extends _$MainViewModel {
  @override
  MainState build() => const MainState();

  final _eventController = StreamController<MainEvent>();

  Stream<MainEvent> get eventStream => _eventController.stream;

  void search(String query) async {
    state = state.copyWith(isLoading: true);

    final useCase = ref.read(searchPhotosUseCaseProvider);

    final result = await useCase.execute(query);
    switch (result) {
      case Success<List<Photo>>():
        state = state.copyWith(photos: result.data);
      case Error<List<Photo>>():
        _eventController.add(MainEvent.showSnackbar('네트워크 에러'));
    }

    state = state.copyWith(isLoading: false);
  }
}
