// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Paginated<T> _$PaginatedFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    Paginated<T>(
      limit: json['limit'] as int,
      pageNumber: json['pageNumber'] as int,
      hasMore: json['hasMore'] as bool,
      items: (json['items'] as List<dynamic>?)?.map(fromJsonT).toList(),
      total: json['total'] as int? ?? 0,
    );

Map<String, dynamic> _$PaginatedToJson<T>(
  Paginated<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'items': instance.items.map(toJsonT).toList(),
      'total': instance.total,
      'limit': instance.limit,
      'pageNumber': instance.pageNumber,
      'hasMore': instance.hasMore,
    };
