import 'package:dartz/dartz.dart';
import 'package:ix/features/auth/data/models/register_params.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../data/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<ServerException, UserModel>> login({
    required String mobileCode,
    required String phone,
    required String password,
  });
  Future<Either<ServerException,UserModel>>register(
    RegisterParams registerParams,
);

}
