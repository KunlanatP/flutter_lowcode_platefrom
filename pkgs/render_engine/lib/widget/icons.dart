import 'dart:convert';

import 'package:flutter/material.dart';

enum IconTheme { regular, filled }

class IconTemplate {
  final String name;
  final IconData iconRegular;
  final IconData? iconFilled;
  final String iconType;

  IconTemplate({
    required this.name,
    required this.iconRegular,
    this.iconFilled,
    this.iconType = 'fluent',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'iconRegular': iconRegular.codePoint,
      'iconFilled': iconFilled?.codePoint,
      'iconType': iconType,
    };
  }

  factory IconTemplate.fromMap(Map<String, dynamic> map) {
    return IconTemplate(
      name: map['name'] as String,
      iconRegular:
          IconData(map['iconRegular'] as int, fontFamily: 'MaterialIcons'),
      iconFilled: map['iconFilled'] != null
          ? IconData(map['iconFilled'] as int, fontFamily: 'MaterialIcons')
          : null,
      iconType: map['iconType'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory IconTemplate.fromJson(String source) =>
      IconTemplate.fromMap(json.decode(source) as Map<String, dynamic>);
}
