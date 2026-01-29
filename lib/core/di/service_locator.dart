import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ix/core/api/api_service/dio_consumer.dart';
import 'package:ix/features/auth/data/repos/auth_repo_impl.dart';
import 'package:ix/features/auth/domain/interfaces/auth_repo.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  sl.registerLazySingleton<Dio>(() => Dio());

  sl.registerLazySingleton<DioConsumer>(() => DioConsumer(dio: sl()));

  sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl()));
}
