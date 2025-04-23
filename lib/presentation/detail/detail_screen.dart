import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_search_app/presentation/detail/detail_view_model.dart';

class DetailScreen extends ConsumerWidget {
  final int id;

  const DetailScreen(this.id, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(detailViewModelProvider.notifier);
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(viewModel),
    );
  }

  Widget _buildBody(DetailViewModel viewModel) {
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
