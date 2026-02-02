import 'package:ix/features/auth/data/models/user_model.dart';

enum LoginStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == LoginStatus.initial;

  bool get isLoading => this == LoginStatus.loading;

  bool get isSuccess => this == LoginStatus.success;

  bool get isFailure => this == LoginStatus.failure;
}
class LoginState {
  final LoginStatus status;
  final String? errorMessage;

  LoginState({
    this.status = LoginStatus.initial,
    this.errorMessage,
  });

  LoginState copyWith({
    LoginStatus? status,
    String? errorMessage,
    UserModel? user,
  }) {
    return LoginState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage
    );
  }
}