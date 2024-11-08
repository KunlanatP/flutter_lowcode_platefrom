import 'package:dio/dio.dart';
import 'package:flutter_lowcode_plateform/models/application/apps_model.dart';
import 'package:flutter_lowcode_plateform/models/error_model.dart';
import 'package:flutter_lowcode_plateform/models/pageable_with_search.dart';
import 'package:flutter_lowcode_plateform/states/error_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_state.dart';

class AppController {
  final Ref _ref;

  AppController(this._ref);

  Future<void> init() async {
    await fetchAllApplications(0, 15, '');
  }

  Future<void> dispose() async {}

  Future<void> fetchAllApplications(int offset, int limit, String name) async {
    try {
      final out = await _ref.read(appRepositoryProvider).getApps(
          PageableWithSearch(offset: offset, limit: limit, search: name));
      _ref.read(appList.notifier).state = AsyncValue.data(out);
    } on DioException catch (err) {
      _ref.read(errorState.notifier).state =
          AppError.fromJson(err.response?.data);
      _ref.read(appList.notifier).state =
          AsyncValue.error(err, StackTrace.current);
    }
  }

  Future<bool> createApplication(AppModel appModel) async {
  try {
    final out =
        await _ref.read(appRepositoryProvider).createApplication(appModel);
    final prev = _ref.read(appList).value;
    final data = Pagination<List<AppModel>>(
      data: [...prev?.data ?? [], out], 
      size: (prev?.size ?? 0) + 1,
      total: (prev?.total ?? 0) + 1,
    );

    _ref.read(appList.notifier).state = AsyncValue.data(data);
    return true;
  } on DioException catch (err) {
    _ref.read(errorState.notifier).state =
        AppError.fromJson(err.response?.data);
    return false;
  }
}


  Future<void> deleteAppByID(String id) async {
    try {
      await _ref.read(appRepositoryProvider).deleteAppById(id);
      final prev = _ref.read(appList).value;
      prev?.data.removeWhere((item) => item.id == id);
      final data = Pagination<List<AppModel>>(
        data: [...prev!.data],
        size: prev.size,
        total: prev.total,
      );

      _ref.read(appList.notifier).state = AsyncValue.data(data);
    } on DioException catch (err) {
      _ref.read(errorState.notifier).state =
          AppError.fromJson(err.response?.data);
    }
  }

  Future<void> fetchAppByID(String id) async {
    try {
      final out = await _ref.read(appRepositoryProvider).getAppById(id);
      _ref.read(currentApp.notifier).state = out;
      _ref.read(appName.notifier).state = out.name;
    } on DioException catch (err) {
      _ref.read(errorState.notifier).state =
          AppError.fromJson(err.response?.data);
    }
  }

  Future<void> updateAppByID(String id, AppModel update) async {
    try {
      final out =
          await _ref.read(appRepositoryProvider).updateAppById(id, update);
      final prev = _ref.read(appList).value;

      final index = prev?.data.indexWhere((element) => element.id == out.id);
      prev?.data[index ?? prev.data.length] = out;
      _ref.read(appList.notifier).state = AsyncValue.data(prev);
      _ref.read(currentApp.notifier).state = out;
    } on DioException catch (err) {
      _ref.read(errorState.notifier).state =
          AppError.fromJson(err.response?.data);
    }
  }
}
