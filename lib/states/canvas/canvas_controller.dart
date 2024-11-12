import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_lowcode_plateform/states/canvas/canvas_edit_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_patch/json_patch.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../environment.dart';
import '../../features/focus_indicator/focus_state.dart';
import '../../features/hover_indicator/hover_state.dart';
import '../../network/http.dart';
import '../../repositories/page_content_repository.dart';

Map<String, dynamic> _emptyPage = <String, dynamic>{
  'id': '8159acf3-ad61-4bce-bd66-c6f473a6ec6a',
  'type': 'scaffold',
  'body': {
    'id': '89de3627-6599-4eeb-b39c-2440cdd48545',
    'type': 'padding',
    'props': {'padding': 20},
    'child': {
      'id': 'b54f8713-d2ed-4fa2-92dd-a2d9b41d6ddd',
      'type': 'center',
      'props': {
        'width': null,
        'height': null,
      },
      'child': {
        'id': '97f86aea-a14a-4894-b4d8-c72ee003b474',
        'type': 'text',
        'props': {
          'data': 'Hello,World!',
          'softWrap': true,
          'maxLines': '1',
          'textAlign': 'left',
          'style': {
            'fontFamily': 'Roboto_regular',
            'fontSize': 34,
            'fontWeight': 'w400',
            'letterSpacing': 0.25,
            'fontStyle': 'normal',
            'decoration': 'none',
            'color': '#FF323232'
          }
        },
      }
    }
  }
};

final contentRepository =
    Provider.autoDispose((ref) => PageContentRepository(HttpClient.dio));

AutoDisposeStateProvider<bool> showAnimation =
    StateProvider.autoDispose<bool>((ref) {
  return false;
});

final canvasNotifier =
    StateProvider.autoDispose<AsyncValue<WidgetData?>>((ref) {
  return const AsyncValue.loading();
});

final canvasController = Provider((ref) {
  print('new CanvasController Instance');
  return CanvasController(ref);
});

class CanvasController {
  CanvasController(this._ref);

  final Ref _ref;
  WebSocketChannel? conn;

  Future<void> init(String appID, String? pageID) async {
    conn = WebSocketChannel.connect(
      Uri.parse('${Env.realtimeURL}/players/$appID/edit?pageID=$pageID'),
    );
    conn?.stream.listen(_onReceiveData, onError: (dynamic err) {
      print('Error: $err');
      conn = null;
    });
  }

  Future<void> emit(Map<String, dynamic> event) async {
    if (conn == null) {
      throw WebSocketChannelException('No socket connected');
    }
    conn?.sink.add(jsonEncode(event));
  }

  void _onReceiveData(dynamic event) {
    print('stream: $event');
    if (event is String) {
      // if edit props mode
      edit(EditPropsAction.fromJson(jsonDecode(event)));
    }
  }

  Future<void> dispose() async {
    _ref.read(canvasNotifier.notifier).state = const AsyncValue.loading();
    if (conn != null) {
      await conn?.sink.close();
    }
  }

  Future<void> fetchLastContent(String appID, String? pageID) async {
    try {
      final data =
          await _ref.read(contentRepository).fetchLastContent(appID, pageID);
      _ref.read(canvasNotifier.notifier).state = AsyncValue.data(data);
      // _ref.read(canvasNotifier.notifier).state = AsyncValue.data(_testPage);
    } on DioException catch (err) {
      _ref.read(canvasNotifier.notifier).state =
          AsyncValue.error(err, StackTrace.current);
    } on NoContentError {
      _ref.read(canvasNotifier.notifier).state = AsyncValue.data(_emptyPage);
    }
  }

  Future<void> edit(EditPropsAction editAction) async {
    final result = JsonPatch.apply(
      _ref.read(canvasNotifier).value,
      [editAction.toJson()],
    );

    _ref.read(canvasNotifier.notifier).state = AsyncValue.data(result);
  }

  Future<void> emitEdit(EditPropsAction editPropsAction) async {
    await edit(editPropsAction);
    await emit(editPropsAction.toJson());
  }

  Future<void> addWidget(EditWidgetAction editAction) async {
    final result = JsonPatch.apply(
      _ref.read(canvasNotifier).value,
      [editAction.toJson()],
    );
    _ref.read(focusState.notifier).clear();
    _ref.read(hoverState.notifier).clear();
    _ref.read(canvasNotifier.notifier).state = AsyncValue.data(result);
    await emit(editAction.toJson());
  }

  Future<void> moveWidget(MoveWidgetAction moveAction) async {
    final result = JsonPatch.apply(
      _ref.read(canvasNotifier).value,
      [moveAction.toJson()],
    );
    _ref.read(focusState.notifier).clear();
    _ref.read(hoverState.notifier).clear();
    _ref.read(canvasNotifier.notifier).state = AsyncValue.data(result);
    await emit(moveAction.toJson());
  }

  Future<void> addParentWidget(EditOperation editOperation) async {
    final child = _ref.read(focusState);
    final currValue = child?.widgetData;
    final replacer = editOperation.value;

    replacer[editOperation.position] = currValue;
    if (editOperation.position == 'children') {
      replacer[editOperation.position] = [currValue];
    }

    final editAction = EditWidgetAction(
      path: editOperation.path,
      value: replacer,
      op: Operation.replace,
    );
    final result = JsonPatch.apply(
      _ref.read(canvasNotifier).value,
      [editAction.toJson()],
    );
    _ref.read(focusState.notifier).clear();
    _ref.read(hoverState.notifier).clear();
    _ref.read(canvasNotifier.notifier).state = AsyncValue.data(result);
    await emit(editAction.toJson());
  }

  Future<void> removeWidget(EditWidgetAction editAction) async {
    final result = JsonPatch.apply(
      _ref.read(canvasNotifier).value,
      [editAction.toJson()],
    );
    _ref.read(focusState.notifier).clear();
    _ref.read(hoverState.notifier).clear();
    _ref.read(canvasNotifier.notifier).state = AsyncValue.data(result);
    await emit(editAction.toJson());
  }

  Future<void> addParentWidgetWhenDrag(
      EditOperation editOperation, dynamic selectedWidget) async {
    final data = _ref.read(canvasNotifier.notifier).state;
    final replacer = editOperation.value;
    final currValue = getLeafFromPath(data.value!, editOperation.path);
    replacer[editOperation.position] = [currValue, selectedWidget];
    final editAction = EditWidgetAction(
      path: editOperation.path,
      value: replacer,
      op: Operation.replace,
    );
    final result = JsonPatch.apply(
      _ref.read(canvasNotifier).value,
      [editAction.toJson()],
    );
    _ref.read(focusState.notifier).clear();
    _ref.read(hoverState.notifier).clear();
    _ref.read(canvasNotifier.notifier).state = AsyncValue.data(result);
    await emit(editAction.toJson());
  }

  dynamic getLeafFromPath(Map<String, dynamic> map, String path) {
    final index = path.split('/');
    dynamic data = index.isEmpty
        ? map['body']
        : (index.length > 1 && index[1] == 'appBar'
            ? map['appBar']
            : map['body']);

    for (var i = 1; i < index.length - 1; i++) {
      data = data[isNumeric(index[i + 1])
          ? int.parse(index[i + 1])
          : index[i + 1].toString()];
    }
    return data;
  }

  bool isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }
}
