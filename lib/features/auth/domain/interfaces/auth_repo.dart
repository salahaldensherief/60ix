import 'package:dartz/dartz.dart';
import 'package:ix/features/auth/data/models/register_params.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../data/models/otp_response.dart';
import '../../data/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<ServerException, UserModel>> login({
    required String mobileCode,
    required String phone,
    required String password,
  });
  Future<Either<ServerException, UserModel>> register(
    RegisterParams registerParams,
  );
  Future<Either<ServerException, OtpResponse>> verifyOtpCode({
    required String otpCode,
    required String mobileNumber,
    required String mobileCode,
  });
  Future<Either<ServerException, UserModel>> forgetPassword({
    required String mobileNumber,
    required String mobileCode,
  });Future<Either<ServerException, UserModel>> passwordOtp({
    required String mobileNumber,
    required String mobileCode,
  });Future<Either<ServerException, UserModel>> setPassword({
    required String mobileNumber,
    required String mobileCode,
    required String password,
    required String confirmedPassword,
  });
}
