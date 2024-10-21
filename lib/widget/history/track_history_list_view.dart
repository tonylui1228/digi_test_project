import 'package:digi_test_project/controller/track_history_controller.dart';
import 'package:digi_test_project/widget/track_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/style.dart';

class TrackHistoryListView extends StatelessWidget {
  final TrackHistoryController controller = Get.put(TrackHistoryController());

  TrackHistoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.separated(
        itemBuilder: (context, index) => TrackTile(
              trackDto: controller.trackDtoList[index],
            ),
        separatorBuilder: (context, index) => const SizedBox(
              height: defaultPadding,
            ),
        itemCount: controller.trackDtoList.length));
  }
}
