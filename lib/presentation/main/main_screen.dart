import 'package:flutter/material.dart';
import 'package:image_search_app/presentation/main/main_action.dart';
import 'package:image_search_app/presentation/main/main_state.dart';

import '../component/photo_item.dart';

class MainScreen extends StatefulWidget {
  final MainState state;
  final void Function(MainAction action) onAction;

  const MainScreen({super.key, required this.state, required this.onAction});

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
              key: ValueKey('searchIcon'),
              child: Icon(Icons.search),
              onTap: () {
                widget.onAction(MainAction.onSearch(queryTextController.text));
              },
            ),
          ),
          onSubmitted: (value) {
            widget.onAction(MainAction.onSearch(queryTextController.text));
          },
        ),
        SizedBox(height: 40),
        if (widget.state.isLoading)
          Center(
            child: CircularProgressIndicator(key: const ValueKey('Loading')),
          ),
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
                key: ValueKey('photo:$index'),
                onTap: () => widget.onAction(MainAction.onTapPhoto(photo)),
                child: PhotoItem(photo: photo),
              );
            },
          ),
        ),
      ],
    );
  }
}
