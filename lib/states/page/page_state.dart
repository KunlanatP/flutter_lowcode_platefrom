import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/page/page_model.dart';
import '../../network/http.dart';
import '../../pages/editor/view/editor_config.dart';
import '../../repositories/page_repository.dart';
import 'page_controller.dart';

AutoDisposeStateProvider<AsyncValue<List<PageModel>?>> pageList =
    StateProvider.autoDispose<AsyncValue<List<PageModel>?>>((ref) {
  return const AsyncValue.loading();
});

AutoDisposeStateProvider<PageModel?> currentPage =
    StateProvider.autoDispose<PageModel?>((ref) {
  return null;
});

AutoDisposeStateProvider<EditorConfigData?> editorConfigData =
    StateProvider.autoDispose<EditorConfigData?>((ref) {
  return null;
});

AutoDisposeStateProvider<PageModel?> homePage =
    StateProvider.autoDispose<PageModel?>((ref) {
  return null;
});

AutoDisposeProvider<PageRepository> pageRepositoryProvider =
    Provider.autoDispose((ref) => PageRepository(HttpClient.dio));

AutoDisposeProvider<PageController> pageController =
    Provider.autoDispose((ref) => PageController(ref));
