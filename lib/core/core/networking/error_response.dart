import 'package:sixty_ix/modules/art_core/art_core.dart';
import 'package:sixty_ix/modules/core/networking/network_mappers.dart';
import 'package:sixty_ix/modules/core/networking/network_response.dart';

class BasicFailure {
  final Map<String, dynamic>? data;
  final int? statusCode;
  final String errorMassage;
  final bool noInternet ;


  ErrorResponse? get errorResponseModel =>
      data == null ? null : ErrorResponse.fromJson(data!);

  BasicFailure({this.data, this.statusCode, required this.errorMassage , this.noInternet = false});

  factory BasicFailure.fromNetworkResponse(NetworkResponse<BaseMappable> res) {
    return BasicFailure(
      data: res.data,
      statusCode: res.statusCode,
      errorMassage: res.errorMessage ?? 'Some_thing_error_repo_sign_in',
      noInternet: res.noInternet,
    );
  }
}

class ErrorResponse {
  String? message;
  List<FieldError>? errors;

  ErrorResponse({this.message, this.errors = const []});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      message: json['error'] as String? ?? json['message'] as String? ?? 'Unknown error',
      errors: (json['errors'] as Map<String, dynamic>?)?.entries.map((entry) {
        return FieldError(
          field: entry.key,
          errors: List<String>.from(entry.value),
        );
      }).toList() ?? [],
    );
  }
}

class FieldError {
  final String field;
  final List<String> errors;

  FieldError({this.field = '', this.errors = const []});
}
