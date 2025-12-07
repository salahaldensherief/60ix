import 'package:sixty_ix/modules/shared/data/models/countries_and_cities_model.dart';
import 'package:sixty_ix/modules/shared/data/models/models.dart';

import '../../core/networking/network_mappers.dart';
import '../../shared/data/models/community/comment_model.dart';

class ListResponsePagination<T>
    extends BaseMappable<ListResponsePagination<T>> {
  final List<T> items;
  final PaginationMeta meta;
  final String? extractListKey;

  ListResponsePagination({
    this.items = const [],
    this.extractListKey,
    this.meta = const PaginationMeta(
      currentPage: 1,
      lastPage: 1,
      perPage: 10,
      total: 1,
    ),
  });

  @override
  ListResponsePagination<T> fromJson(Map<String, dynamic> json) {
    final dataField = json['data'];
    if (dataField == null) {
      return ListResponsePagination(items: []);
    }

    if (extractListKey != null && dataField is! List) {
      return ListResponsePagination<T>(
        items:
            (json['data'][extractListKey]['data'] as List<dynamic>)
                .map(
                  (item) =>
                      (T == dynamic)
                          ? item as T
                          : _parseItem<T>(item as Map<String, dynamic>),
                )
                .toList(),
        meta: PaginationMeta.fromJson(json['meta'] ?? {}),
      );
    }
    return ListResponsePagination<T>(
      items:
          (json['data'] as List<dynamic>)
              .map(
                (item) =>
                    (T == dynamic)
                        ? item as T
                        : _parseItem<T>(item as Map<String, dynamic>),
              )
              .toList(),
      meta: PaginationMeta.fromJson(json['meta'] ?? {}),
    );
  }

  int get currentPage => meta.currentPage;

  bool get hasMore => meta.hasMore;

  static T _parseItem<T>(Map<String, dynamic> json) {
    // You must handle parsing by model type here manually or by factory map
    if (T == PostModel) return PostModel.fromJson(json) as T;
    if (T == CommentModel) return CommentModel.fromJson(json) as T;
    if (T == ServiceModel) return ServiceModel.fromJson(json) as T;
    if (T == ReviewsModel) return ReviewsModel.fromJson(json) as T;
    if (T == VendorModel) return VendorModel.fromJson(json) as T;
    if (T == CountriesAndCitiesModel) return CountriesAndCitiesModel.fromJson(json) as T;
    if (T == BannerModel) return BannerModel.fromJson(json) as T;
    if (T == ReviewsModel) return ReviewsModel.fromJson(json) as T;
    throw UnimplementedError("Parsing not implemented for type $T");
  }
}

class PaginationMeta {
  final int currentPage;
  final int lastPage;
  final int perPage;
  final int total;

  const PaginationMeta({
    this.currentPage = 1,
    this.lastPage = 1,
    this.perPage = 10,
    this.total = 0,
  });

  factory PaginationMeta.fromJson(Map<String, dynamic> json) {
    return PaginationMeta(
      currentPage: json['current_page'] ?? 1,
      lastPage: json['last_page'] ?? 1,
      perPage: json['per_page'] ?? 10,
      total: json['total'] ?? 0,
    );
  }

  PaginationMeta.defaults()
    : this(currentPage: 1, lastPage: 1, perPage: 10, total: 0);

  bool get hasMore => currentPage < lastPage;
}
