import 'package:ix/features/auth/data/models/user_model.dart';

enum SignupStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == SignupStatus.initial;

  bool get isLoading => this == SignupStatus.loading;

  bool get isSuccess => this == SignupStatus.success;

  bool get isFailure => this == SignupStatus.failure;
}

class SignupState {
  final String? mobileNumber;
  final String? mobileCode;
  final SignupStatus status;
  final String? errorMessage;

  SignupState({
    this.status = SignupStatus.initial,
    this.errorMessage,
    this.mobileNumber,
    this.mobileCode,
  });

  SignupState copyWith({
    final String? mobileNumber,
    final String? mobileCode,
    SignupStatus? status,
    String? errorMessage,
    UserModel? user,
  }) {
    return SignupState(
      mobileNumber: mobileNumber ?? this.mobileNumber,
      mobileCode: mobileCode ?? this.mobileCode,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
