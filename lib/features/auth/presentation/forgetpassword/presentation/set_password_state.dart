import '../../../data/models/user_model.dart';

enum SetPasswordStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == SetPasswordStatus.initial;

  bool get isLoading => this == SetPasswordStatus.loading;

  bool get isSuccess => this == SetPasswordStatus.success;

  bool get isFailure => this == SetPasswordStatus.failure;
}
class SetPasswordState {
  final SetPasswordStatus status;
  final String? errorMessage;

  SetPasswordState({
    this.status = SetPasswordStatus.initial,
    this.errorMessage,
  });
  SetPasswordState copyWith({
    SetPasswordStatus? status,
    String? errorMessage,
    UserModel? user,
  }) {
    return SetPasswordState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
