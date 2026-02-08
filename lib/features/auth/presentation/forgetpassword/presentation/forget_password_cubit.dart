import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:ix/features/auth/domain/interfaces/auth_repo.dart';

import 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  AuthRepo authRepo;
  ForgetPasswordCubit({required this.authRepo})
    : super(ForgetPasswordState(status: ForgetPasswordStatus.initial));
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController mobileCode = TextEditingController();

  Future<void> forgetPassword({
    required String mobileNumber,
    required String mobileCode,
  }) async {
    emit(state.copyWith(status: ForgetPasswordStatus.loading));
    final res = await authRepo.forgetPassword(
      mobileNumber: mobileNumber,
      mobileCode: '+${mobileCode}',
    );
    res.fold(
      (l) => emit(
        state.copyWith(
          status: ForgetPasswordStatus.failure,
          errorMessage: l.errorModel.message,
        ),
      ),
      (r) =>
          emit(state.copyWith(status: ForgetPasswordStatus.success, user: r)),
    );
  }
}
