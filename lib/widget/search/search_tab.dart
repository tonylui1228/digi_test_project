import 'package:digi_test_project/const/style.dart';
import 'package:digi_test_project/widget/search/search_result_list_view.dart';
import 'package:digi_test_project/widget/search/search_text_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/itunes_search_controller.dart';

class SearchTab extends StatelessWidget {
  final ItunesSearchController controller = Get.put(ItunesSearchController());

  SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: defaultAllEdgePadding,
        child: Column(
          children: [
            SearchTextBar(controller: controller),
            Expanded(child: SearchResultListView(controller: controller)),
          ],
        ));
  }
}
