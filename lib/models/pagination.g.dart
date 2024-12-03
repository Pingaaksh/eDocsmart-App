// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// Pagination<T> _$PaginationFromJson<T>(
//   Map<String, dynamic> json,
//   T Function(Object? json) fromJsonT,
// ) =>
//     Pagination<T>(
//       data: (json['data'] as List<dynamic>?)?.map(fromJsonT).toList(),
//       currentPage: json['current_page'] as int?,
//       firstPageUrl: json['first_page_url'] as String?,
//       from: json['from'] as int?,
//       lastPage: json['last_page'] as int?,
//       lastPageUrl: json['last_page_url'] as String?,
//       nextPageUrl: json['next_page_url'] as String?,
//       path: json['path'] as String?,
//       perPage: json['per_page'] as int?,
//       prevPageUrl: json['prev_page_url'] as String?,
//       sortBy: json['sort_by'] as String?,
//       to: json['to'] as int?,
//       total: json['total'] as int?,
//       page: json['page'] as int?,
//       search: json['search'] as String?,
//     );

Map<String, dynamic> _$PaginationToJson<T>(
  Pagination<T> instance,
  Object? Function(T value) toJsonT,
) {
  var val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data?.map(toJsonT).toList());
  writeNotNull('current_page', instance.currentPage);
  writeNotNull('first_page_url', instance.firstPageUrl);
  writeNotNull('from', instance.from);
  writeNotNull('last_page', instance.lastPage);
  writeNotNull('last_page_url', instance.lastPageUrl);
  writeNotNull('next_page_url', instance.nextPageUrl);
  writeNotNull('path', instance.path);
  writeNotNull('per_page', instance.perPage);
  writeNotNull('prev_page_url', instance.prevPageUrl);
  writeNotNull('to', instance.to);
  writeNotNull('total', instance.total);
  writeNotNull('search', instance.search);
  writeNotNull('page', instance.page);
  writeNotNull('sort_by', instance.sortBy);
  return val;
}
