import 'dart:developer';

import 'package:sixty_ix/modules/art_core/custom_pagination/list_response_pagination.dart';

import 'package:dartz/dartz.dart';

import '../../core/networking/error_response.dart';
import '../../core/networking/network_handler.dart';
import '../../core/networking/network_mappers.dart';
import 'pagination_params.dart';

class PaginatedService<T> {
  final String endpoint;
  final T Function(Map<String, dynamic>) fromJson;
  final String? extractListKey;
  final NetworkHandler _networkHandler;

  PaginatedService({
    required this.endpoint,
    required this.fromJson,
    this.extractListKey, // 👈 optional nested key like "vendors"
    NetworkHandler? networkHandler,
  }) : _networkHandler = networkHandler ?? NetworkHandler();

  Future<Either<BasicFailure, BaseMappable>> fetch(
    PaginatedParams params,
  ) async {
    try {
      final response = await _networkHandler.get(
        ListResponsePagination<T>(extractListKey: extractListKey),
        // dummy for interface
        endpoint,
        queryParams: params.toJson(),
      );

      if (!response.isRequestSuccess) {
        return Left(BasicFailure.fromNetworkResponse(response));
      }

      final rawJson = response.data as Map<String, dynamic>;

      // 🔍 Drill down into the dynamic data structure
      dynamic resultBlock = rawJson['data'];
      if (extractListKey != null && resultBlock is Map<String, dynamic>) {
        resultBlock = resultBlock[extractListKey];
      }

      List<dynamic> dataList;
      PaginationMeta meta;

      if (resultBlock is List) {
        // flat structure like: { "data": [ ... ], "meta": { ... } }
        dataList = resultBlock;
        meta = PaginationMeta.fromJson(rawJson['meta'] ?? {});
      }
      else if (resultBlock is Map<String, dynamic>) {
        dataList = resultBlock['data'] ?? [];
        meta = PaginationMeta.fromJson(resultBlock['meta'] ?? {});
      } else {
        // fallback
        dataList = [];
        meta = PaginationMeta.defaults();
      }

      final parsedItems =
          dataList
              .map((item) => fromJson(item as Map<String, dynamic>))
              .toList();

      // final parsedItems =
      //     (resultBlock['data'] as List<Map<String, dynamic>>)
      //         .map((item) => fromJson(item))
      //         .toList();
      //
      // final meta = PaginationMeta.fromJson(resultBlock['meta'] ?? {});

      final parsedResponse = ListResponsePagination<T>(
        items: parsedItems,
        meta: meta,
        extractListKey: extractListKey,
      );

      return Right(parsedResponse);
    } catch (e, s) {
      log("Error_Pagination_Services $e $s");
      return Left(BasicFailure(errorMassage: '$e\n$s'));
    }
  }
}
