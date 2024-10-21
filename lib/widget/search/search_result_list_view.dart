import 'package:digi_test_project/controller/itunes_search_controller.dart';
import 'package:digi_test_project/widget/track_shimmer_tile.dart';
import 'package:digi_test_project/widget/track_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/style.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key, required this.controller});

  final ItunesSearchController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isLoading.value
        ? ListView.separated(
            itemBuilder: (context, index) => const TrackShimmerTile(),
            separatorBuilder: (context, index) => const SizedBox(
                  height: defaultPadding,
                ),
            itemCount: 5)
        : ListView.separated(
            itemBuilder: (context, index) => TrackTile(
                  trackDto: controller.trackDtoList[index],
                ),
            separatorBuilder: (context, index) => const SizedBox(
                  height: defaultPadding,
                ),
            itemCount: controller.trackDtoList.length));
  }
}
