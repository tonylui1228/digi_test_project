import 'package:digi_test_project/const/style.dart';
import 'package:digi_test_project/widget/history/track_history_list_view.dart';
import 'package:flutter/material.dart';

class TrackHistoryTab extends StatelessWidget {
  const TrackHistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: defaultAllEdgePadding,
        child: Column(
          children: [
            Expanded(child: TrackHistoryListView()),
          ],
        ));
  }
}
