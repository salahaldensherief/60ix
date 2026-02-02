import 'package:ix/features/auth/data/models/user_model.dart';

enum RegisterStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == RegisterStatus.initial;

  bool get isLoading => this == RegisterStatus.loading;

  bool get isSuccess => this == RegisterStatus.success;

  bool get isFailure => this == RegisterStatus.failure;
}
class RegisterState {
  final RegisterStatus status;
  final String? errorMessage;

  RegisterState({
    this.status = RegisterStatus.initial,
    this.errorMessage,
  });

  RegisterState copyWith({
    RegisterStatus? status,
    String? errorMessage,
    UserModel? user,
  }) {
    return RegisterState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage
    );
  }
}