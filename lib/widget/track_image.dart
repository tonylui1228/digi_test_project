import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../const/style.dart';
import '../model/track_dto.dart';

class TrackImage extends StatelessWidget {
  TrackImage({super.key, required this.trackDto});

  TrackDto trackDto;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: trackDto.artworkUrl100 ?? '',
      height: previewImageSize,
      width: previewImageSize,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.colorBurn)),
        ),
      ),
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
