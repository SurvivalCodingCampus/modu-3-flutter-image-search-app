import 'package:flutter/material.dart';
import 'package:image_search_app/core/result.dart';
import 'package:image_search_app/domain/model/photo.dart';
import 'package:image_search_app/domain/use_case/search_photo_use_case.dart';
import 'package:image_search_app/presentation/detail/detail_state.dart';

class DetailViewModel with ChangeNotifier {
  final SearchPhotoUseCase _searchPhotoUseCase;

  DetailViewModel(this._searchPhotoUseCase);

  DetailState _state = const DetailState();

  DetailState get state => _state;

  void fetchPhoto(int id) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _searchPhotoUseCase.execute(id);
    switch (result) {
      case Success<Photo>():
        _state = state.copyWith(photo: result.data);
      case Error<Photo>():
        _state = state.copyWith(photo: null);
        print(result.e);
    }

    _state = state.copyWith(isLoading: false);
    notifyListeners();
  }
}
