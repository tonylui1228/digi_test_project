import 'package:digi_test_project/const/style.dart';
import 'package:digi_test_project/controller/track_detail_controller.dart';
import 'package:digi_test_project/widget/track_detail/track_action_button.dart';
import 'package:digi_test_project/widget/track_detail/track_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const/images.dart';

class TrackDetailPage extends StatelessWidget {
  TrackDetailPage({super.key});

  final TrackDetailController controller =
      Get.put(TrackDetailController(Get.arguments));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(controller.trackDto.trackName ?? ''),
        ),
        body: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height,
                padding: defaultAllEdgePadding,
                child: Column(children: [
                  Image.asset(diskPlayImage),
                  TrackProgressBar(player: controller.player),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TrackActionButton(
                          icon: Icons.skip_previous,
                          isEnabled: controller.isPreviewAble(),
                          onPressed: () => controller.skipPrevious()),
                      Obx(() => controller.isPlaying.value
                          ? TrackActionButton(
                              icon: Icons.pause,
                              isEnabled: controller.isPreviewAble(),
                              onPressed: () => controller.pause())
                          : TrackActionButton(
                              icon: Icons.play_arrow,
                              isEnabled: controller.isPreviewAble(),
                              onPressed: () => controller.play(),
                            )),
                      TrackActionButton(
                        icon: Icons.skip_next,
                        isEnabled: controller.isPreviewAble(),
                        onPressed: () => controller.isPreviewAble()
                            ? controller.skipNext()
                            : null,
                      ),
                    ],
                  ))
                ]))));
  }
}
