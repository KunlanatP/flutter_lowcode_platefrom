import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/error_model.dart';
import '../../models/page/page_model.dart';
import '../../models/pageable/paging_model.dart';
import '../../models/query/query.dart';
import '../../pages/editor/view/editor_config.dart';
import '../error_state.dart';
import 'page_state.dart';

class PageController {
  final Ref _ref;
  PageController(this._ref);

  Future<void> init() async {
    _ref.read(pageList.notifier).state = const AsyncValue.loading();
  }

  Future<void> dispose() async {
    _ref.read(currentPage.notifier).state = null;
    _ref.read(pageList.notifier).state = const AsyncValue.loading();
  }

  Future<void> fetchPages(String name, String appId) async {
    try {
      final out = await _ref
          .read(pageRepositoryProvider)
          .getPages(QueryPaging(name, appId));
      _ref.read(pageList.notifier).state = AsyncValue.data(out);
    } on DioException catch (err) {
      _ref.read(errorState.notifier).state =
          AppError(ErrorMessage('${err.message}'));
      _ref.read(pageList.notifier).state =
          AsyncValue.error(err, StackTrace.current);
    }
  }

  Future<void> fetchPagesByID(String? pageId, QueryByApp search) async {
    try {
      final out = await _ref.read(pageRepositoryProvider).getPageById(
            pageId ?? 'home',
            search,
          );
      _ref.read(currentPage.notifier).state = out;
      if (out.isHome!) {
        _ref.read(homePage.notifier).state = out;
      }

      _ref.read(editorConfigData.notifier).state = EditorConfigData(
        appID: out.appId,
        pageID: out.id,
      );
    } on DioException catch (err) {
      if (err.response?.statusCode != 404) {
        _ref.read(errorState.notifier).state =
            AppError.fromJson(err.response?.data);
        _ref.read(pageList.notifier).state =
            AsyncValue.error(err, StackTrace.current);
      } else {
        _ref.read(pageList.notifier).state = const AsyncValue.data([]);
      }
    }
  }

  Future<void> createPage(PageModel pageModel) async {
    try {
      final out = await _ref.read(pageRepositoryProvider).createPage(pageModel);
      final prev = _ref.read(pageList).value;
      final data = <PageModel>[...prev ?? [], out];
      _ref.read(pageList.notifier).state = AsyncValue.data(data);
      if (prev!.isEmpty) {
        _ref.read(currentPage.notifier).state = out;
      }
      if (out.isHome ?? false) {
        _ref.read(homePage.notifier).state = out;
      }
    } on DioException catch (err) {
      _ref.read(errorState.notifier).state =
          AppError.fromJson(err.response?.data);
    }
  }

  Future<void> deletePagesByID(String pageId, String appID) async {
    try {
      await _ref.read(pageRepositoryProvider).deletePageById(pageId);
      final prev = _ref.read(pageList).value;
      prev?.removeWhere((item) => item.id == pageId);
      _ref.read(pageList.notifier).state = AsyncValue.data([...prev!]);
      await fetchPagesByID('home', QueryByApp(appId: appID));
    } on DioException catch (err) {
      if (err.response?.statusCode != 404) {
        _ref.read(errorState.notifier).state =
            AppError.fromJson(err.response?.data);
        _ref.read(pageList.notifier).state =
            AsyncValue.error(err, StackTrace.current);
      }
    }
  }

  Future<void> setHome(String pageId, String appID) async {
    try {
      await _ref.read(pageRepositoryProvider).setHome(
            pageId,
            QueryByApp(appId: appID),
          );
      await fetchPages('', appID);
      final curr = _ref.read(currentPage);
      await fetchPagesByID(curr?.id, QueryByApp(appId: appID));
    } on DioException catch (err) {
      if (err.response?.statusCode != 404) {
        _ref.read(errorState.notifier).state =
            AppError.fromJson(err.response?.data);
        _ref.read(pageList.notifier).state =
            AsyncValue.error(err, StackTrace.current);
      } else {
        _ref.read(pageList.notifier).state = const AsyncValue.data([]);
      }
    }
  }
}
