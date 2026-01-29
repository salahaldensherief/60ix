
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ix/core/errors/exceptions.dart';
import 'package:ix/features/auth/data/models/user_model.dart';

import '../../../../core/api/api_service/api_endpoint.dart';
import '../../../../core/api/api_service/dio_consumer.dart';
import '../../../../core/errors/error_model.dart';
import '../../domain/interfaces/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final DioConsumer dio;

  AuthRepoImpl(this.dio);

  ServerException _handleDioError(DioException e) {
    try {
      handleDioExceptions(e);
      return ServerException(
        errorModel: ErrorModel(message: 'Unexpected network error.'),
      );
    } on ServerException catch (serverError) {
      return serverError;
    } catch (e) {
      return ServerException(
        errorModel: ErrorModel(message: 'Unexpected error: ${e.toString()}'),
      );
    }
  }
  @override
  Future<Either<ServerException, UserModel>> login({
    required String phone,
    required String mobileCode,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        ApiEndPoint.login,
        data: {
          "mobile_number": phone,
          "mobile_code": mobileCode,
          "password": password,
        },
      );
      return Right(UserModel.fromJson(response));
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerException(
        errorModel: ErrorModel(message: 'Unexpected error.'),
      ));
    }
  }
}