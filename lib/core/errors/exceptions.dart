import 'dart:convert';

import 'package:dio/dio.dart';
import 'error_model.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException({required this.errorModel});
}

ServerException handleDioExceptions(DioException e) {
  String message = "Something went wrong, please try again later.";

  if (e.response != null && e.response!.data != null) {
    try {
      final data = e.response!.data;
      Map<String, dynamic> jsonData;
      if (data is String) {
        jsonData = jsonDecode(data);
      } else if (data is Map<String, dynamic>) {
        jsonData = data;
      } else {
        jsonData = {};
      }

      if (jsonData.containsKey('message')) {
        message = jsonData['message'];
      } else if (jsonData.containsKey('errors')) {
        final errors = jsonData['errors'] as Map<String, dynamic>;
        if (errors.isNotEmpty) {
          final firstKey = errors.keys.first;
          final firstErrorList = errors[firstKey] as List<dynamic>;
          if (firstErrorList.isNotEmpty) {
            message = firstErrorList.first.toString();
          }
        }
      }
    } catch (_) {
      message = "Unexpected server error.";
    }
  } else {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout. Please check your internet connection.";
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout. Try again later.";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout. Please try again later.";
        break;
      case DioExceptionType.badCertificate:
        message = "Bad certificate from server.";
        break;
      case DioExceptionType.cancel:
        message = "Request was cancelled.";
        break;
      case DioExceptionType.connectionError:
        message = "No internet connection. Please try again.";
        break;
      case DioExceptionType.unknown:
        message = "Unknown error occurred. Please try again.";
        break;
      default:
        message = "Unexpected error. Please try again later.";
    }
  }

  if (e.type == DioExceptionType.badResponse) {
    switch (e.response?.statusCode) {
      case 400:
        message = "Bad request. Please check your data.";
        break;
      case 401:
        message = "Unauthorized. Please log in again.";
        break;
      case 403:
        message = "Access denied.";
        break;
      case 404:
        message = "Resource not found.";
        break;
      case 409:
        message = "Conflict. This data may already exist.";
        break;

      case 422:
        final data = e.response!.data;
        try {
          final jsonData = data is String ? jsonDecode(data) : data;
          if (jsonData is Map<String, dynamic> &&
              jsonData.containsKey('message')) {
            message = jsonData['message'];
          }
        } catch (_) {}
        break;
      case 500:
        message = "Internal server error. Try again later.";
        break;
      case 504:
        message = "Server timeout. Please try again later.";
        break;
      default:
        message = "Server error: ${e.response?.statusCode ?? 'Unknown'}";
        break;
    }
  }

  return ServerException(errorModel: ErrorModel(message: message));
}
