import 'package:flutter/material.dart';

import '../../domain/model/photo.dart';

class PhotoItem extends StatelessWidget {
  final Photo photo;

  const PhotoItem({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: CircleAvatar(backgroundImage: NetworkImage(photo.imageUrl)),
    );
  }
}
