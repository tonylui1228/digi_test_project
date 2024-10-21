import 'package:digi_test_project/const/style.dart';
import 'package:digi_test_project/controller/itunes_search_controller.dart';
import 'package:digi_test_project/exception/network_exception.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../../const/l10n_keys.dart';

class SearchTextBar extends StatelessWidget {
  const SearchTextBar({super.key, required this.controller});

  final ItunesSearchController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(children: [
      Expanded(
          child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        textInputAction: TextInputAction.search,
        decoration: const InputDecoration(
          contentPadding: defaultAllEdgePadding,
          border: InputBorder.none,
          suffixIcon: Icon(Icons.search),
        ),
        onFieldSubmitted: (val) => _doItunesSearch(val),
      )),
    ]));
  }

  void _doItunesSearch(String term) {
    if (term.length < 4) {
      Fluttertoast.showToast(msg: tr(errorSearchTermTooShort));
    } else {
      Get.find<ItunesSearchController>()
          .doItunesSearch(term, _onItunesSearchError);
    }
  }

  void _onItunesSearchError(Exception error) {
    if (error is NetworkException) {
      Fluttertoast.showToast(msg: tr(errorNetwork));
    } else {
      Fluttertoast.showToast(msg: tr(errorGeneric));
    }
  }
}
