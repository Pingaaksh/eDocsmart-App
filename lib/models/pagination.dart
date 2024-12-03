import 'package:json_annotation/json_annotation.dart';
import 'package:skin_match/core/common/app_utills.dart';

part 'pagination.g.dart';

@JsonSerializable(includeIfNull: false, genericArgumentFactories: true)
class Pagination<T> {
  @JsonKey(name: 'data')
  List<T>? data;
  @JsonKey(name: 'current_page')
  int? currentPage;
  @JsonKey(name: 'first_page_url')
  String? firstPageUrl;
  int? from;
  @JsonKey(name: 'last_page')
  int? lastPage;
  @JsonKey(name: 'last_page_url')
  String? lastPageUrl;
  @JsonKey(name: 'next_page_url')
  String? nextPageUrl;
  String? path;
  @JsonKey(name: 'per_page')
  int? perPage;
  @JsonKey(name: 'prev_page_url')
  String? prevPageUrl;
  int? to;
  int? total;
  String? search;
  int? page;
  @JsonKey(name: 'sort_by')
  String? sortBy;

  Pagination({
    this.data,
    this.currentPage,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.sortBy,
    this.to,
    this.total,
    this.page,
    this.search,
  });

  /// Converts Json string to Map Object
  factory Pagination.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> data) fromJsonT,
  ) {
    return Pagination<T>(
      data: tryParseList(
        (json['data'] as List<dynamic>),
        (json) => fromJsonT.call(json),
      ),
      currentPage: json['current_page'] as int?,
      firstPageUrl: json['first_page_url'] as String?,
      from: json['from'] as int?,
      lastPage: json['last_page'] as int?,
      lastPageUrl: json['last_page_url'] as String?,
      nextPageUrl: json['next_page_url'] as String?,
      path: json['path'] as String?,
      perPage: json['per_page'] as int?,
      prevPageUrl: json['prev_page_url'] as String?,
      sortBy: json['sort_by'] as String?,
      to: json['to'] as int?,
      total: json['total'] as int?,
      page: json['page'] as int?,
      search: json['search'] as String?,
    );
  }

  /// Converts Object to Json String
  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$PaginationToJson(this, toJsonT);

// convertData<T extends Serializable>() {
//   return data);
// }
}
