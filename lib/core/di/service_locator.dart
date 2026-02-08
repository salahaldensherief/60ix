import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ix/core/api/api_service/dio_consumer.dart';
import 'package:ix/features/auth/data/repos/auth_repo_impl.dart';
import 'package:ix/features/auth/domain/interfaces/auth_repo.dart';
import 'package:ix/features/auth/presentation/login/login_cubit.dart';
import 'package:ix/features/auth/presentation/signup/signup_cubit.dart';
import 'package:ix/features/auth/presentation/signup/verify_otp_cubit.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  sl.registerLazySingleton<Dio>(() => Dio());

  sl.registerLazySingleton<DioConsumer>(() => DioConsumer(dio: sl()));
  sl.registerLazySingleton<LoginCubit>(()=> LoginCubit(authRepo: sl()));
  sl.registerLazySingleton<SignupCubit>(()=> SignupCubit(authRepo: sl()));

  sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl()));
  sl.registerLazySingleton<VerifyOtpCubit>(()=> VerifyOtpCubit(authRepo: sl(),));
}
