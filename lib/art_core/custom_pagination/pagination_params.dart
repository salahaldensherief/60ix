abstract class PaginatedParams {
  int page;
  int limit;

  PaginatedParams({required this.page, required this.limit});

  Map<String, dynamic> toJson();
}
