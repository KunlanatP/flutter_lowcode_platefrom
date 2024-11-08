import 'dart:convert';

class Position {
  final double x;
  final double y;
  Position({
    required this.x,
    required this.y,
  });

  Position copyWith({
    double? x,
    double? y,
  }) {
    return Position(
      x: x ?? this.x,
      y: y ?? this.y,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'x': x,
      'y': y,
    };
  }

  factory Position.fromMap(Map<String, dynamic> map) {
    return Position(
      x: map['x'],
      y: map['y'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Position.fromJson(String source) =>
      Position.fromMap(json.decode(source));

  @override
  String toString() => 'Position(x: $x, y: $y)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Position && other.x == x && other.y == y;
  }

  @override
  int get hashCode => x.hashCode ^ y.hashCode;
}
