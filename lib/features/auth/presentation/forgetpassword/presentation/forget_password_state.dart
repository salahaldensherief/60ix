import '../../../data/models/user_model.dart';

enum ForgetPasswordStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == ForgetPasswordStatus.initial;

  bool get isLoading => this == ForgetPasswordStatus.loading;

  bool get isSuccess => this == ForgetPasswordStatus.success;

  bool get isFailure => this == ForgetPasswordStatus.failure;
}

class ForgetPasswordState {
  final ForgetPasswordStatus status;
  final String? errorMessage;

  ForgetPasswordState({
    this.status = ForgetPasswordStatus.initial,
    this.errorMessage,
  });
  ForgetPasswordState copyWith({
    ForgetPasswordStatus? status,
    String? errorMessage,
    UserModel? user,
}){
    return ForgetPasswordState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
