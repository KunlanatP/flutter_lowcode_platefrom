// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

enum FontGroups {
  custom,
  system,
}

Map<String, String> mapFontGroups = {
  'custom': 'My Fonts',
  'system': 'Systems',
  'google': 'Google Fonts',
};

Map<String, String> mapThemeGroups = {
  'custom': 'My Theme',
  'system': 'Systems',
};

Map<String, String> mapIconsGroups = {
  'custom': 'My Icons',
  'system': 'Systems',
};

class FontStylesModel {
  String? colorTheme;
  TextStyleModel? textStyle;
  String? width;
  String? height;

  FontStylesModel({
    this.colorTheme,
    this.textStyle,
    this.width,
    this.height,
  });

  FontStylesModel.button({
    this.colorTheme,
    this.width,
    this.height,
  });

  FontStylesModel copyWith({
    String? colorTheme,
    TextStyleModel? textStyle,
    String? width,
    String? height,
  }) {
    return FontStylesModel(
      colorTheme: colorTheme ?? this.colorTheme,
      textStyle: textStyle ?? this.textStyle,
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'colorTheme': colorTheme,
      'textStyle': textStyle?.toMap(),
      'width': width,
      'height': height,
    };
  }

  factory FontStylesModel.fromMap(Map<String, dynamic> map) {
    return FontStylesModel(
      colorTheme:
          map['colorTheme'] != null ? map['colorTheme'] as String : null,
      textStyle: map['textStyle'] != null
          ? TextStyleModel.fromMap(map['textStyle'] as Map<String, dynamic>)
          : null,
      width: map['width'] != null ? map['width'] as String : null,
      height: map['height'] != null ? map['height'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FontStylesModel.fromJson(String source) =>
      FontStylesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FontStylesModel(colorTheme: $colorTheme, textStyle: $textStyle, width: $width, height: $height)';
  }
}

class TextStyleModel {
  String? textTheme;
  String? fontFamily;
  double? fontSize;
  String? fontWeight;
  double? letterSpacing;
  String? fontStyle;
  String? decoration;
  String? colorTheme;
  String? keyValue;

  TextStyleModel(
      {this.textTheme,
      this.fontFamily,
      this.fontSize,
      this.fontWeight,
      this.letterSpacing,
      this.fontStyle,
      this.decoration,
      this.colorTheme,
      this.keyValue});

  TextStyleModel.text({
    this.textTheme,
    this.fontFamily,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
  });

  TextStyleModel copyWith(
      {String? textTheme,
      String? fontFamily,
      double? fontSize,
      String? fontWeight,
      double? letterSpacing,
      String? fontStyle,
      String? decoration,
      String? colorTheme,
      String? keyValue}) {
    return TextStyleModel(
        textTheme: textTheme ?? this.textTheme,
        fontFamily: fontFamily ?? this.fontFamily,
        fontSize: fontSize ?? this.fontSize,
        fontWeight: fontWeight ?? this.fontWeight,
        letterSpacing: letterSpacing ?? this.letterSpacing,
        fontStyle: fontStyle ?? this.fontStyle,
        decoration: decoration ?? this.decoration,
        colorTheme: colorTheme ?? this.colorTheme,
        keyValue: keyValue ?? this.keyValue);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'textTheme': textTheme,
      'fontFamily': fontFamily,
      'fontSize': fontSize,
      'fontWeight': fontWeight,
      'letterSpacing': letterSpacing,
      'fontStyle': fontStyle,
      'decoration': decoration,
      'colorTheme': colorTheme,
      'keyValue': keyValue
    };
  }

  factory TextStyleModel.fromMap(Map<String, dynamic> map) {
    return TextStyleModel(
      textTheme: map['textTheme'] != null ? map['textTheme'] as String : null,
      fontFamily:
          map['fontFamily'] != null ? map['fontFamily'] as String : null,
      fontSize: map['fontSize']?.toDouble() ?? 0.0,
      fontWeight:
          map['fontWeight'] != null ? map['fontWeight'] as String : null,
      letterSpacing: map['letterSpacing']?.toDouble() ?? 0.0,
      fontStyle: map['fontStyle'] != null ? map['fontStyle'] as String : null,
      decoration:
          map['decoration'] != null ? map['decoration'] as String : null,
      colorTheme:
          map['colorTheme'] != null ? map['colorTheme'] as String : null,
      keyValue: map['keyValue'] != null ? map['keyValue'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TextStyleModel.fromJson(String source) =>
      TextStyleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TextStyleModel(textTheme: $textTheme, fontFamily: $fontFamily, fontSize: $fontSize, fontWeight: $fontWeight, letterSpacing: $letterSpacing, fontStyle: $fontStyle, decoration: $decoration, colorTheme: $colorTheme, keyValue: $keyValue)';
  }
}
