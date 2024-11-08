import 'dart:convert';

import 'position_data.dart';
import 'widget_info.dart';

class HoverEvent {
  /// Event type
  final String event;

  /// Widget name
  final String type;

  /// Mouse position
  final Position position;

  /// RenderBox information
  final WidgetInfo rect;
  HoverEvent({
    this.event = "hover",
    required this.type,
    required this.position,
    required this.rect,
  });

  HoverEvent copyWith({
    String? event,
    String? type,
    Position? position,
    WidgetInfo? rect,
  }) {
    return HoverEvent(
      event: event ?? this.event,
      type: type ?? this.type,
      position: position ?? this.position,
      rect: rect ?? this.rect,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'event': event,
      'type': type,
      'position': position.toMap(),
      'rect': rect.toMap(),
    };
  }

  factory HoverEvent.fromMap(Map<String, dynamic> map) {
    return HoverEvent(
      event: map['event'],
      type: map['type'],
      position: Position.fromMap(map['position']),
      rect: WidgetInfo.fromMap(map['rect']),
    );
  }

  String toJson() => json.encode(toMap());

  factory HoverEvent.fromJson(String source) =>
      HoverEvent.fromMap(json.decode(source));

  @override
  String toString() {
    return 'HoverEvent(event: $event, type: $type, position: $position, rect: $rect)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HoverEvent &&
        other.event == event &&
        other.type == type &&
        other.position == position &&
        other.rect == rect;
  }

  @override
  int get hashCode {
    return event.hashCode ^ type.hashCode ^ position.hashCode ^ rect.hashCode;
  }
}
