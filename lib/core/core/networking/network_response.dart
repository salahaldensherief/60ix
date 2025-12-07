import 'dart:developer';

import 'network_mappers.dart';

class NetworkResponse<T> {
  final T body;
  final Map<String, dynamic>? data;

  final bool isRequestSuccess;
  final String? errorMessage;
  final int? statusCode;
  final bool noInternet;

  NetworkResponse({
    required this.body,
    required this.isRequestSuccess,
    this.errorMessage,
    this.statusCode,
    this.data,
    this.noInternet = false,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['body'] = body;
    data['isRequestSuccess'] = isRequestSuccess;
    if (errorMessage != null) data['errorMessage'] = errorMessage;
    if (statusCode != null) data['statusCode'] = statusCode;
    if (noInternet) data['noInternet'] = noInternet;
    return data;
  }
}

class BoolResponse extends BaseMappable {
  bool? resBool = false;

  BoolResponse({this.resBool});

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    log('BoolResponse fromJson: $json');
    if (json.isEmpty) return BoolResponse(resBool: true);
    if (json['message'] == null) return BoolResponse(resBool: false);
    return BoolResponse(resBool: true);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = resBool;
    return data;
  }
}

class StringResponse extends BaseMappable {
  String? resString = '';

  StringResponse({this.resString});

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    resString = json['message'];
    return StringResponse(resString: resString);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = resString;
    return data;
  }
}
