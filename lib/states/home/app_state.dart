import 'package:flutter_lowcode_plateform/models/application/apps_model.dart';
import 'package:flutter_lowcode_plateform/models/pageable_with_search.dart';
import 'package:flutter_lowcode_plateform/network/http.dart';
import 'package:flutter_lowcode_plateform/repositories/apps_repository.dart';
import 'package:flutter_lowcode_plateform/states/home/app_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

AutoDisposeStateProvider<AsyncValue<Pagination<List<AppModel>>?>> appList =
    StateProvider.autoDispose<AsyncValue<Pagination<List<AppModel>>?>>((ref) {
  return const AsyncValue.loading();
});

AutoDisposeStateProvider<AppModel?> currentApp =
    StateProvider.autoDispose<AppModel?>((ref) {
  return null;
});

AutoDisposeStateProvider<String?> themeMode =
    StateProvider.autoDispose<String?>((ref) {
  return 'lightMode';
});

AutoDisposeStateProvider<String> appName =
    StateProvider.autoDispose<String>((ref) {
  return '';
});

final appRepositoryProvider =
    Provider.autoDispose((ref) => AppRepository(HttpClient.dio));

final appController = Provider.autoDispose((ref) => AppController(ref));
