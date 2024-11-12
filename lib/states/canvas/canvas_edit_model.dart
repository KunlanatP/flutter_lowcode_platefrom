import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'canvas_edit_model.g.dart';

enum Operation {
  @JsonValue('replace')
  replace,
  @JsonValue('add')
  add,
  @JsonValue('remove')
  remove,
  @JsonValue('copy')
  copy,
  @JsonValue('move')
  move,
  @JsonValue('test')
  test
}

typedef WidgetData = Map<String, dynamic>;

class EditOperation {
  final String path;
  final String position;
  final WidgetData value;
  const EditOperation({
    required this.path,
    required this.position,
    required this.value,
  });
}

@immutable
@JsonSerializable()
class EditPropsAction {
  final String path;
  final dynamic value;
  final Operation op;
  const EditPropsAction({
    required this.path,
    this.value,
    required this.op,
  });

  factory EditPropsAction.fromJson(Map<String, dynamic> json) =>
      _$EditPropsActionFromJson(json);

  Map<String, dynamic> toJson() => _$EditPropsActionToJson(this);

  @override
  String toString() => 'EditPropsAction(path: $path, value: $value, op: $op)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EditPropsAction &&
        other.path == path &&
        other.value == value &&
        other.op == op;
  }

  @override
  int get hashCode => path.hashCode ^ value.hashCode ^ op.hashCode;
}

@immutable
@JsonSerializable()
class EditWidgetAction {
  final String path;
  final Map<String, dynamic>? value;
  final Operation op;
  const EditWidgetAction({
    required this.path,
    this.value,
    required this.op,
  });

  factory EditWidgetAction.fromJson(Map<String, dynamic> json) =>
      _$EditWidgetActionFromJson(json);

  Map<String, dynamic> toJson() => _$EditWidgetActionToJson(this);
}

@immutable
@JsonSerializable()
class MoveWidgetAction {
  final String path;
  final String from;
  final Operation op;
  const MoveWidgetAction({
    required this.path,
    required this.from,
    required this.op,
  });

  factory MoveWidgetAction.fromJson(Map<String, dynamic> json) =>
      _$MoveWidgetActionFromJson(json);

  Map<String, dynamic> toJson() => _$MoveWidgetActionToJson(this);
}
