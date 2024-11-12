import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'paging_model.g.dart';

@immutable
@JsonSerializable()
class QueryPaging {
  final String search;
  @JsonKey(name: 'app')
  final String appId;

  const QueryPaging(
    this.search,
    this.appId,
  );

  factory QueryPaging.fromJson(Map<String, dynamic> json) =>
      _$QueryPagingFromJson(json);
  Map<String, dynamic> toJson() => _$QueryPagingToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QueryPaging &&
        other.search == search &&
        other.appId == appId;
  }

  @override
  int get hashCode => search.hashCode ^ appId.hashCode;
}
