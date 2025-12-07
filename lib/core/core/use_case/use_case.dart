// Package imports:
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../networking/error_response.dart';

abstract class BasicUseCase<Type, Params> {
  Future<Either<BasicFailure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

/// BasicUseCaseWithOutParams

abstract interface class BasicUseCaseWithOutParams<Type> {
  Future<Either<BasicFailure, Type>> call();
}
