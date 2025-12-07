import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:sixty_ix/modules/art_core/art_core.dart';
import 'package:sixty_ix/modules/art_core/helper_functions/utilities.dart';

import '../cache/preference_manager.dart';
import '../error_tracking/app_error_tracking_handler.dart';
import 'api_constant.dart';
import 'dio_client.dart';
import 'network_mappers.dart';
import 'network_response.dart';

export 'package:flutter_modular/flutter_modular.dart';

class NetworkHandler {
  final Dio dio = DioClient().dio;
  final ApiConfigurations configurations = ApiConfigurations();

  Future<NetworkResponse<ResponseType>> get<ResponseType extends Mappable>(
    ResponseType responseType,
    String url, {
    var body,
    bool canLogOut = true,
    bool enableShowErrorToast = true,
    Map<String, dynamic>? queryParams,
  }) async {
    var response;
    try {
      if (await Utilities.checkInternet() == false) {
        showToast(AppString.noInternetConnection.tr());
        return NetworkResponse(
          body: responseType,
          isRequestSuccess: false,
          data: null,
          statusCode: 0,
          errorMessage: AppString.noInternetConnection.tr(),
          noInternet: true,
        );
      }

      response = await dio.get(url, data: body, queryParameters: queryParams);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        showToast(AppString.noInternetConnection.tr());
        return NetworkResponse(
          body: responseType,
          isRequestSuccess: false,
          data: null,
          statusCode: 0,
          errorMessage: AppString.noInternetConnection.tr(),
          noInternet: true,
        );
      }
      if (e.response != null) {
        response = e.response;
      }
    }
    return handleResponse<ResponseType>(
      response,
      responseType,
      canLogOut: canLogOut,
      enableShowErrorToast: enableShowErrorToast
    );
  }

  Future<NetworkResponse<ResponseType>> post<ResponseType extends Mappable>(
    ResponseType responseType,
    String url, {
    var body,
    encoding,
    bool canLogOut = true,
  }) async {
    var response;
    try {
      if (await Utilities.checkInternet() == false) {
        showToast(AppString.noInternetConnection.tr());
        return NetworkResponse(
          body: responseType,
          isRequestSuccess: false,
          data: null,
          statusCode: 0,
          errorMessage: AppString.noInternetConnection.tr(),
          noInternet: true,
        );
      }

      response = await dio.post(
        url,
        data: body,
        options: Options(requestEncoder: encoding),
      );
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        showToast(AppString.noInternetConnection.tr());
        return NetworkResponse(
          body: responseType,
          isRequestSuccess: false,
          data: null,
          statusCode: 0,
          errorMessage: AppString.noInternetConnection.tr(),
          noInternet: true,
        );
      }
      if (e.response != null) {
        response = e.response;
      }
    }
    return handleResponse<ResponseType>(
      response,
      responseType,
      canLogOut: canLogOut,
    );
  }

  Future<NetworkResponse<ResponseType>> postAuth<ResponseType extends Mappable>(
    ResponseType responseType,
    String url, {
    var body,
    encoding,
    bool canLogOut = true,
  }) async {
    var response;
    // debugPrint("***************POST $url , body: $body ***************");

    try {
      if (await Utilities.checkInternet() == false) {
        // showToast(msg).

        showToast(
          AppString.noInternetConnection.tr(),
          // states: ToastStates.ERROR,
          // showAllText: true,
        );
        return NetworkResponse(
          body: responseType,
          isRequestSuccess: false,
          data: null,
          statusCode: 0,
          errorMessage: AppString.noInternetConnection.tr(),
          noInternet: true,
        );
      }
      response = await dio.post(
        url,
        data: body,
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      Log.error(responseType.toString() + response.statusCode.toString());
      if (response.statusCode == 200) {}
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        showToast(AppString.noInternetConnection.tr());
        return NetworkResponse(
          body: responseType,
          isRequestSuccess: false,
          data: null,
          statusCode: 0,
          errorMessage: AppString.noInternetConnection.tr(),
          noInternet: true,
        );
      }
      if (e.response != null) {
        response = e.response;
      }
    }

    return handleResponse<ResponseType>(
      response,
      responseType,
      canLogOut: canLogOut,
    );
  }

  Future<NetworkResponse<ResponseType>> put<ResponseType extends Mappable>(
    ResponseType responseType,
    String url, {
    var body,
    encoding,
    Map<String, String>? headers,
    bool canLogOut = true,
  }) async {
    var response;
    // debugPrint("*************** PUT $url , body: $body ***************  ");

    try {
      if (await Utilities.checkInternet() == false) {
        showToast(AppString.noInternetConnection.tr());
        return NetworkResponse(
          body: responseType,
          isRequestSuccess: false,
          data: null,
          statusCode: 0,
          errorMessage: AppString.noInternetConnection.tr(),
          noInternet: true,
        );
      }

      if (headers != null) {
        dio.options.headers = headers;
      }
      response = await dio.put(
        url,
        data: body,
        options: Options(requestEncoder: encoding),
      );
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        showToast(AppString.noInternetConnection.tr());
        return NetworkResponse(
          body: responseType,
          isRequestSuccess: false,
          data: null,
          statusCode: 0,
          errorMessage: AppString.noInternetConnection.tr(),
          noInternet: true,
        );
      }
      //  debugPrint(e.toString());
      if (e.response != null) {
        response = e.response;
      }
    }
    return handleResponse<ResponseType>(
      response,
      responseType,
      canLogOut: canLogOut,
    );
  }

  Future<NetworkResponse<ResponseType>> delete<ResponseType extends Mappable>(
    ResponseType responseType,
    String url, {
    var body,
    encoding,
    bool canLogOut = true,
  }) async {
    var response;
    // debugPrint("*************** Delete $url , body: $body ***************  ");

    try {
      if (await Utilities.checkInternet() == false) {
        // showToast(msg).

        showToast(AppString.noInternetConnection.tr());
        return NetworkResponse(
          body: responseType,
          isRequestSuccess: false,
          data: null,
          statusCode: 0,
          errorMessage: AppString.noInternetConnection.tr(),
          noInternet: true,
        );
      }

      response = await dio.delete(
        url,
        data: body,
        options: Options(requestEncoder: encoding),
      );
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        showToast(AppString.noInternetConnection.tr());
        return NetworkResponse(
          body: responseType,
          isRequestSuccess: false,
          data: null,
          statusCode: 0,
          errorMessage: AppString.noInternetConnection.tr(),
          noInternet: true,
        );
      }
      if (e.response != null) {
        response = e.response;
      }
    }
    return handleResponse<ResponseType>(
      response,
      responseType,
      canLogOut: canLogOut,
    );
  }

  NetworkResponse<ResponseType> handleResponse<ResponseType extends Mappable>(
    Response response,
    ResponseType responseType, {
    bool canLogOut = true,
    bool enableShowErrorToast = true,
  }) {
    try {
      final int statusCode = response.statusCode!;
      // debugPrint(
      //   "Request :: ${response.requestOptions.method} ::  ${response.requestOptions.path}  :: body ::  ${response.requestOptions.data}  ::  Headers ::  ${response.requestOptions.headers} :: Status_Code_is :: $statusCode",
      // );

      if (statusCode >= 200 && statusCode < 300) {
        if (responseType is ListMappable) {
          return NetworkResponse<ResponseType>(
            body: Mappable(responseType, response.data) as ResponseType,
            isRequestSuccess: true,
            data: response.data,
            statusCode: statusCode,
          );
        } else {
          return NetworkResponse<ResponseType>(
            body: Mappable(responseType, response) as ResponseType,
            isRequestSuccess: true,
            data: response.data,
            statusCode: statusCode,
          );
        }
      } else if (statusCode == 401) {
        PreferenceManager().logout();
        if (canLogOut) {
          PreferenceManager().logout();
          // Modular.to.navigate(NavigatorKeys.AUTH_KEY);
        }
        final serverMessage =
            response.data['message'] ?? 'some_thing_want_wrong'.tr();

        if(enableShowErrorToast){

        showToast(serverMessage);
        }

        return NetworkResponse<ResponseType>(
          body: Mappable(responseType, response) as ResponseType,
          isRequestSuccess: false,
          data: response.data,
          errorMessage: serverMessage,
          statusCode: statusCode,
        );
      } else if (statusCode >= 500) {
        final request = response.requestOptions;
        final errorMessage =
            response.data?['message'] ??
            response.data?['error'] ??
            'some_thing_want_wrong'.tr();

        AppErrorTrackingHandler.reportServerError(response);

        if(enableShowErrorToast){

          showToast(errorMessage);

        }
        return NetworkResponse<ResponseType>(
          body: Mappable(responseType, response) as ResponseType,
          isRequestSuccess: false,
          errorMessage: errorMessage,
          data: response.data,
          statusCode: statusCode,
        );
      } else {
        debugPrint("request_error: ${response.data}");
        String serverMessage = 'some_thing_want_wrong'.tr();
        if (response.data is Map) {
          serverMessage =
              response.data['message'] ??
              response.data['error'] ??
              'some_thing_want_wrong'.tr();
        } else {
          serverMessage = response.data.toString();
        }

        if(enableShowErrorToast){

          showToast(serverMessage);


        }
        return NetworkResponse<ResponseType>(
          body: Mappable(responseType, response) as ResponseType,
          isRequestSuccess: false,
          errorMessage: serverMessage,
          data: response.data,
          statusCode: statusCode,
        );
      }
    } catch (e) {
      return NetworkResponse<ResponseType>(
        body: Mappable(responseType, response) as ResponseType,
        isRequestSuccess: false,
        errorMessage: e.toString(), // 'something_went_wrong'.tr()
      );
    }
  }

  void showToast(String msg) {
    AppToast.error(msg);
  }
}
