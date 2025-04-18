import 'package:flutter/material.dart';
import 'package:image_search_app/presentation/detail/detail_view_model.dart';

class DetailScreen extends StatelessWidget {
  final DetailViewModel viewModel;

  const DetailScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, snapshot) {
          return _buildBody();
        },
      ),
    );
  }

  Widget _buildBody() {
    if (viewModel.state.isLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (viewModel.state.photo == null) {
      return Center(child: Text('그림이 없음'));
    }
    final photo = viewModel.state.photo!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          photo.imageUrl,
          width: double.infinity,
          height: 400,
          fit: BoxFit.cover,
        ),
        Text(photo.user),
        Text(photo.tags),
      ],
    );
  }
}
