import 'package:json_annotation/json_annotation.dart';

part 'page_model.g.dart';

enum PageType {
  @JsonValue('blank')
  blank,
  @JsonValue('tab')
  tab,
  @JsonValue('modal')
  modal,
  @JsonValue('drawer')
  drawer,
  @JsonValue('simple')
  simple,
}

@JsonSerializable()
class PageModel {
  String? id;
  final String name;
  final String appId;
  final PageType type;
  bool? isHome;
  String? routePath;
  String? template;

  PageModel({
    required this.id,
    required this.name,
    required this.appId,
    required this.type,
    required this.isHome,
    required this.routePath,
    this.template,
  });

  PageModel.create({
    required this.name,
    required this.appId,
    required this.type,
    required this.template,
  });

  PageModel copyWith({
    String? id,
    String? name,
    String? appId,
    PageType? type,
    bool? isHome,
    String? routePath,
    String? template,
  }) {
    return PageModel(
      id: id ?? this.id,
      name: name ?? this.name,
      appId: appId ?? this.appId,
      type: type ?? this.type,
      isHome: isHome ?? this.isHome,
      routePath: routePath ?? this.routePath,
      template: template ?? this.template,
    );
  }

  factory PageModel.fromJson(Map<String, dynamic> json) =>
      _$PageModelFromJson(json);
  Map<String, dynamic> toJson() => _$PageModelToJson(this);
}
