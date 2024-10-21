import 'package:digi_test_project/const/l10n_keys.dart';
import 'package:digi_test_project/model/track_dto.dart';
import 'package:digi_test_project/page/landing_page.dart';
import 'package:digi_test_project/page/track_detail_page.dart';
import 'package:digi_test_project/repository/itunes_search_repository.dart';
import 'package:digi_test_project/repository/restful_client_repository.dart';
import 'package:digi_test_project/repository/track_history_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

final getIt = GetIt.instance;

void main() async {
  await setupHive();
  await setupGetIt();
  await setupL10n();
  runApp(EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [Locale('en'), Locale('zh')],
      fallbackLocale: const Locale('en'),
      child: const DigiTestApp()));
}

Future setupGetIt() async {
  getIt.registerLazySingleton<RestfulClientRepository>(
      () => RestfulClientRepository.init());
  getIt.registerLazySingleton<ItunesSearchRepository>(
      () => ItunesSearchRepository(getIt.get<RestfulClientRepository>()),);

  getIt.registerLazySingletonAsync<TrackHistoryRepository>(() async {
    TrackHistoryRepository repository = await TrackHistoryRepository.create();
    return repository;
  });
}

Future setupHive() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDirectory.path);
  Hive.registerAdapter(TrackDtoAdapter());
}

Future setupL10n() async {
  await EasyLocalization.ensureInitialized();
}

class DigiTestApp extends StatelessWidget {
  const DigiTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: tr(appTitle),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LandingPage(),
      getPages: [
        GetPage(name: '/landing', page: () => const LandingPage()),
        GetPage(
          name: '/track_detail',
          page: () {
            return TrackDetailPage();
          },
        ),
      ],
      navigatorObservers: [FlutterSmartDialog.observer],
      builder: FlutterSmartDialog.init(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
