import 'package:ix/features/auth/data/models/otp_response.dart';

enum VerifyOtpStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == VerifyOtpStatus.initial;

  bool get isLoading => this == VerifyOtpStatus.loading;

  bool get isSuccess => this == VerifyOtpStatus.success;

  bool get isFailure => this == VerifyOtpStatus.failure;
}

class VerifyOtpState {
  final VerifyOtpStatus status;
  final String? errorMessage;
  VerifyOtpState({this.status = VerifyOtpStatus.initial, this.errorMessage});
  VerifyOtpState copyWith({
    VerifyOtpStatus? status,
    String? errorMessage,
    OtpResponse? otpResponse,
  }) {
    return VerifyOtpState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
