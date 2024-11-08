import 'dart:convert';

class Rect {
  final double width;
  final double height;
  final double top;
  final double left;
  Rect({
    required this.width,
    required this.height,
    required this.top,
    required this.left,
  });

  Rect copyWith({
    double? width,
    double? height,
    double? top,
    double? left,
  }) {
    return Rect(
      width: width ?? this.width,
      height: height ?? this.height,
      top: top ?? this.top,
      left: left ?? this.left,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'width': width,
      'height': height,
      'top': top,
      'left': left,
    };
  }

  factory Rect.fromMap(Map<String, dynamic> map) {
    return Rect(
      width: map['width']?.toDouble() ?? 0.0,
      height: map['height']?.toDouble() ?? 0.0,
      top: map['top']?.toDouble() ?? 0.0,
      left: map['left']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Rect.fromJson(String source) => Rect.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Rect(width: $width, height: $height, top: $top, left: $left)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Rect &&
        other.width == width &&
        other.height == height &&
        other.top == top &&
        other.left == left;
  }

  @override
  int get hashCode {
    return width.hashCode ^ height.hashCode ^ top.hashCode ^ left.hashCode;
  }
}

class WidgetInfo {
  final String id;
  final Rect rect;
  const WidgetInfo({
    required this.id,
    required this.rect,
  });

  WidgetInfo copyWith({
    String? id,
    Rect? rect,
  }) {
    return WidgetInfo(
      id: id ?? this.id,
      rect: rect ?? this.rect,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'rect': rect.toMap(),
    };
  }

  factory WidgetInfo.fromMap(Map<String, dynamic> map) {
    return WidgetInfo(
      id: map['id'] ?? '',
      rect: Rect.fromMap(map['rect']),
    );
  }

  String toJson() => json.encode(toMap());

  factory WidgetInfo.fromJson(String source) =>
      WidgetInfo.fromMap(json.decode(source));

  @override
  String toString() => 'WidgetInfo(id: $id, rect: $rect)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WidgetInfo && other.id == id && other.rect == rect;
  }

  @override
  int get hashCode => id.hashCode ^ rect.hashCode;
}
