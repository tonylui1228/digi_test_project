import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../const/style.dart';

class TrackShimmerTile extends StatelessWidget {
  const TrackShimmerTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
            padding: defaultAllEdgePadding,
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              _createShimmerView(Container(
                  width: previewImageSize,
                  height: previewImageSize,
                  color: Colors.black)),
              const SizedBox(width: defaultPadding),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _createShimmerView(Container(
                        width: double.infinity,
                        color: Colors.black,
                        child: Text(
                          'dummy text',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      )),
                      const SizedBox(height: smallPadding),
                      _createShimmerView(Container(
                        color: Colors.black,
                        child: Text(
                          'dummy text',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ))
                    ]),
              )
            ])));
  }

  Widget _createShimmerView(Widget widget) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: widget);
  }
}
