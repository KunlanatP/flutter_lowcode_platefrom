import 'package:flutter_lowcode_plateform/models/error_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

AutoDisposeStateProvider<AppError?> errorState =
    StateProvider.autoDispose<AppError?>((ref) {
  return null;
});

AutoDisposeStateProvider<String?> errorStateColor =
    StateProvider.autoDispose<String?>((ref) {
  return null;
});
