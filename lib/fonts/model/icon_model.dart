// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class IconModel {
  String? data;
  String? theme;
  String? colorTheme;
  double? size;

  IconModel({
    this.data,
    this.theme,
    this.colorTheme,
    this.size,
  });

  IconModel copyWith({
    String? data,
    String? theme,
    String? colorTheme,
    double? size,
  }) {
    return IconModel(
      data: data ?? this.data,
      theme: theme ?? this.theme,
      colorTheme: colorTheme ?? this.colorTheme,
      size: size ?? this.size,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data,
      'theme': theme,
      'colorTheme': colorTheme,
      'size': size,
    };
  }

  factory IconModel.fromMap(Map<String, dynamic> map) {
    return IconModel(
      data: map['data'] != null ? map['data'] as String : null,
      theme: map['theme'] != null ? map['theme'] as String : null,
      colorTheme:
          map['colorTheme'] != null ? map['colorTheme'] as String : null,
      size: map['size']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory IconModel.fromJson(String source) =>
      IconModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
