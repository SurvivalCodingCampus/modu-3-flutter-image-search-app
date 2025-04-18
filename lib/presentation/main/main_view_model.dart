import 'package:flutter/material.dart';
import 'package:image_search_app/core/result.dart';
import 'package:image_search_app/domain/model/photo.dart';
import 'package:image_search_app/domain/use_case/search_photos_use_case.dart';
import 'package:image_search_app/presentation/main/main_state.dart';

class MainViewModel with ChangeNotifier {
  final SearchPhotosUseCase _searchPhotosUseCase;

  MainViewModel({required SearchPhotosUseCase searchPhotosUseCase})
    : _searchPhotosUseCase = searchPhotosUseCase;

  MainState _state = const MainState();

  MainState get state => _state;

  void search(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _searchPhotosUseCase.execute(query);
    switch (result) {
      case Success<List<Photo>>():
        _state = state.copyWith(photos: result.data);
      case Error<List<Photo>>():
        print(result.e);
    }

    _state = state.copyWith(isLoading: false);
    notifyListeners();
  }
}
