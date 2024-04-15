import 'package:json_annotation/json_annotation.dart';

part 'paginated.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class Paginated<T> {
  Paginated({
    required this.limit,
    required this.pageNumber,
    required this.hasMore,
    List<T>? items,
    this.total = 0,
  }) : items = items ?? const [];

  factory Paginated.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return _$PaginatedFromJson(json, fromJsonT);
  }

  List<T> items;
  int total;
  int limit;
  int pageNumber;
  bool hasMore;

  Map<String, dynamic> toJson(
    Object? Function(T value) toJsonT,
  ) {
    return _$PaginatedToJson(this, toJsonT);
  }
}
