import 'package:flutter/material.dart';
import 'package:image_search_app/presentation/main/main_state.dart';

import '../../domain/model/photo.dart';
import '../component/photo_item.dart';

class MainScreen extends StatefulWidget {
  final MainState state;
  final void Function(String query) onSearch;
  final void Function(Photo photo) onTapPhoto;

  const MainScreen({
    super.key,
    required this.state,
    required this.onSearch,
    required this.onTapPhoto,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final queryTextController = TextEditingController();

  @override
  void dispose() {
    queryTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('이미지 검색 앱'), centerTitle: true),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        TextField(
          controller: queryTextController,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              child: Icon(Icons.search),
              onTap: () {
                widget.onSearch(queryTextController.text);
              },
            ),
          ),
          onSubmitted: (value) {
            widget.onSearch(queryTextController.text);
          },
        ),
        SizedBox(height: 40),
        if (widget.state.isLoading)
          Center(child: CircularProgressIndicator(key: const ValueKey('Loading'))),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: widget.state.photos.length,
            itemBuilder: (BuildContext context, int index) {
              final photo = widget.state.photos[index];
              return GestureDetector(
                onTap: () => widget.onTapPhoto.call(photo),
                child: PhotoItem(photo: photo),
              );
            },
          ),
        ),
      ],
    );
  }
}
