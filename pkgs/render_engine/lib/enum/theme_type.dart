import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
enum ThemeType { system, custom }

extension ThemeTypeExtension on ThemeType {
  String get value {
    switch (this) {
      case ThemeType.system:
        return 'default';
      case ThemeType.custom:
        return 'custom';
      default:
        return 'default';
    }
  }
}

enum SystemThemeDefault {
  primary,
  onPrimary,
  secondary,
  onSecondary,
  error,
  onError,
  background,
  onBackground,
  surface,
  onSurface
}

class ThemeColorModel {
  final String name;
  final String lightMode;
  final String darkMode;
  final String themeType;

  ThemeColorModel({
    required this.name,
    required this.lightMode,
    required this.darkMode,
    this.themeType = 'default',
  });

  ThemeColorModel copyWith({
    String? name,
    String? lightMode,
    String? darkMode,
    String? themeType,
  }) {
    return ThemeColorModel(
      name: name ?? this.name,
      lightMode: lightMode ?? this.lightMode,
      darkMode: darkMode ?? this.darkMode,
      themeType: themeType ?? this.themeType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      themeType: {
        name: {
          'lightMode': lightMode,
          'darkMode': darkMode,
        }
      }
    };
  }

  factory ThemeColorModel.fromMap(Map<String, dynamic> map) {
    return ThemeColorModel(
      name: map['name'] as String,
      lightMode: map['lightMode'] as String,
      darkMode: map['darkMode'] as String,
      themeType: map['themeType'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ThemeColorModel.fromJson(String source) =>
      ThemeColorModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ThemeColorModel(name: $name, lightMode: $lightMode, darkMode: $darkMode, themeType: $themeType)';
  }

  @override
  bool operator ==(covariant ThemeColorModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.lightMode == lightMode &&
        other.darkMode == darkMode &&
        other.themeType == themeType;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        lightMode.hashCode ^
        darkMode.hashCode ^
        themeType.hashCode;
  }
}
