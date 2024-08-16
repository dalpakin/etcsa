import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../core/formatter.dart';

class ProfileImageViewer extends StatelessWidget {
  final String stuID;

  const ProfileImageViewer({
    super.key,
    required this.stuID,
  });

  @override
  Widget build(BuildContext context) {
    String profileUrl =
        "https://odin-oasis.izmirekonomi.edu.tr/images/photos/${Formatters.calculateHmacMd5(stuID, "QrkASUy1MBbIzCo2B")}.jpg";
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: profileUrl,
        placeholder: (context, url) => Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade200,
          ),
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade200,
          ),
          child: const Icon(
            Icons.error,
            color: Colors.red,
          ),
        ),
        width: 200,
        height: 200,
        fit: BoxFit.contain,
      ),
    );
  }
}
