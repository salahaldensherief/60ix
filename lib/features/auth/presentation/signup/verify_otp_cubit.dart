import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:ix/core/flutter_secure_storage.dart';
import 'package:ix/features/auth/presentation/signup/verify_otp_state.dart';
import 'package:meta/meta.dart';

import '../../../../art_core/utils/constants.dart';
import '../../domain/interfaces/auth_repo.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  final AuthRepo authRepo;

  VerifyOtpCubit({required this.authRepo})
    : super(VerifyOtpState(status: VerifyOtpStatus.initial));
  TextEditingController otpCode = TextEditingController();
  GlobalKey<FormState> otpFormKey = GlobalKey();

  Future<void> verifyOtp({
    required String code,
    required String mobileNumber,
    required String mobileCode,
  }) async {
    emit(state.copyWith(status: VerifyOtpStatus.loading));

    final res = await authRepo.verifyOtpCode(
      mobileCode: '+${mobileCode}',
      mobileNumber: mobileNumber,
      otpCode: otpCode.text,
    );
    res.fold(
      (left) => emit(
        state.copyWith(
          status: VerifyOtpStatus.failure,
          errorMessage: left.errorModel.message,
        ),
      ),
      (res) => emit(
        state.copyWith(status: VerifyOtpStatus.success, otpResponse: res),
      ),
    );
  }
}
