import 'package:flutter/material.dart';
import 'package:image_search_app/presentation/component/photo_item.dart';
import 'package:image_search_app/presentation/main/main_state.dart';
import 'package:image_search_app/presentation/main/main_view_model.dart';

import '../../domain/model/photo.dart';

class MainScreen extends StatefulWidget {
  final void Function(Photo photo) onTapPhoto;
  final MainViewModel viewModel;

  const MainScreen({
    super.key,
    required this.viewModel,
    required this.onTapPhoto,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final queryTextController = TextEditingController();

  MainViewModel get viewModel => widget.viewModel;

  MainState get state => widget.viewModel.state;

  @override
  void dispose() {
    queryTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (_, _) {
        return Scaffold(
          appBar: AppBar(title: Text('이미지 검색 앱'), centerTitle: true),
          body: Column(
            children: [
              TextField(
                controller: queryTextController,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    child: Icon(Icons.search),
                    onTap: () {
                      viewModel.search(queryTextController.text);
                    },
                  ),
                ),
                onSubmitted: (value) {
                  viewModel.search(value);
                },
              ),
              SizedBox(height: 40),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: state.photos.length,
                  itemBuilder: (BuildContext context, int index) {
                    final photo = state.photos[index];
                    return GestureDetector(
                      onTap: () => widget.onTapPhoto.call(photo),
                      child: PhotoItem(photo: photo),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
