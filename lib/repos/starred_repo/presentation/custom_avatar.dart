import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  final String url;
  final Color backgroundColor;
  const CustomAvatar({
    Key? key,
    required this.url,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backgroundColor,
      child: Container(
        decoration: const BoxDecoration(shape: BoxShape.circle),
        clipBehavior: Clip.antiAlias,
        child: CachedNetworkImage(
          imageUrl: url,
          errorWidget: (context, url, error) {
            return Image.asset('assets/default_avatar.png');
          },
        ),
      ),
    );
  }
}
