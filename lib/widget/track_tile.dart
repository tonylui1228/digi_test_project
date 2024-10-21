import 'package:digi_test_project/page/track_detail_page.dart';
import 'package:digi_test_project/widget/track_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const/style.dart';
import '../model/track_dto.dart';

class TrackTile extends StatelessWidget {
  final TrackDto trackDto;

  const TrackTile({super.key, required this.trackDto});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {
              Get.to(() => TrackDetailPage(),
                  arguments: trackDto,
                  transition: Transition.rightToLeftWithFade)
            },
        child: Card(
            child: Padding(
                padding: defaultAllEdgePadding,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TrackImage(trackDto: trackDto),
                      const SizedBox(width: defaultPadding),
                      Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text(
                              trackDto.trackName ?? '',
                              style: Theme.of(context).textTheme.bodyLarge,
                              maxLines: 2,
                            ),
                            const SizedBox(height: smallPadding),
                            Text(trackDto.artistName ?? ''),
                          ])),
                    ]))));
  }
}
