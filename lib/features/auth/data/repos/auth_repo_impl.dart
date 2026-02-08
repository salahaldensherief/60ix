import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ix/core/errors/exceptions.dart';
import 'package:ix/features/auth/data/models/otp_response.dart';
import 'package:ix/features/auth/data/models/register_params.dart';
import 'package:ix/features/auth/data/models/user_model.dart';

import '../../../../art_core/utils/constants.dart';
import '../../../../core/api/api_service/api_endpoint.dart';
import '../../../../core/api/api_service/dio_consumer.dart';
import '../../../../core/errors/error_model.dart';
import '../../domain/interfaces/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final DioConsumer dio;

  AuthRepoImpl(this.dio);
  ServerException _handleDioError(DioException e) {
    try {
      return handleDioExceptions(e);
    } on ServerException catch (serverError) {
      return serverError;
    } catch (e) {
      return ServerException(errorModel: ErrorModel(message: 'Unexpected error: ${e.toString()}'));
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
          ConstStrings.mobileNumber: phone,
          ConstStrings.mobileCode: mobileCode,
          ConstStrings.password: password,
        },
      );
      return Right(UserModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
        ServerException(errorModel: ErrorModel(message: 'Unexpected error.')),
      );
    }
  }

  @override
  Future<Either<ServerException, UserModel>> register(
    RegisterParams registerParams,
  ) async {
    try {
      final response = await dio.post(
        ApiEndPoint.register,
        data: registerParams.toJson(),
      );
      return right(UserModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
        ServerException(errorModel: ErrorModel(message: 'Unexpected error.')),
      );
    }
  }

  @override
  Future<Either<ServerException, OtpResponse>> verifyOtpCode({
    required String otpCode,
    required String mobileNumber,
    required String mobileCode,
  }) async {
    try {
      final response = await dio.post(
        ApiEndPoint.verifyOtp,
        data: {
          ConstStrings.mobileCode: mobileCode,
          ConstStrings.mobileNumber: mobileNumber,
          ConstStrings.otp: otpCode,
        },
      );
      return Right(OtpResponse.fromJson(response));
    } on ServerException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
        ServerException(errorModel: ErrorModel(message: 'Unexpected error.')),
      );
    }
  }

  @override
  Future<Either<ServerException, UserModel>> forgetPassword({
    required String mobileNumber,
    required String mobileCode,
  }) async {
    try {
      final response = await dio.post(
        ApiEndPoint.forgetPassword,
        data: {ConstStrings.mobileCode: mobileCode, ConstStrings.mobileNumber: mobileNumber},
      );
      return Right(UserModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
        ServerException(errorModel: ErrorModel(message: 'Unexpected error.')),
      );
    }
  }

  @override
  Future<Either<ServerException, UserModel>> createNewPassword({
    required String mobileNumber,
    required String mobileCode,
    required String password,
    required String confirmedPassword,
  }) async{
    try{
      final response = await dio.post(ApiEndPoint.setPassword,data: {
        ConstStrings.mobileCode: mobileCode,
        ConstStrings.mobileNumber: mobileNumber,
        ConstStrings.password:password,
        ConstStrings.passwordConfirmation: confirmedPassword,
      });
      return Right(UserModel.fromJson(response));

    }on ServerException catch (e){
      return Left(e);
    }catch(e){
      return Left(ServerException(errorModel: ErrorModel(message: 'Unexpected error.')));
    }
  }
}
