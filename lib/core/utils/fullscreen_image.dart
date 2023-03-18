import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import 'image_path.dart';

class FullScreenImage extends StatelessWidget {
  final String image;
  const FullScreenImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: PhotoView(
          imageProvider:  AssetImage(image),
          initialScale: PhotoViewComputedScale.contained,
          minScale: PhotoViewComputedScale.contained * 0.9,
          maxScale: PhotoViewComputedScale.covered * 3,
        ),
      ),
    );
  }
}
