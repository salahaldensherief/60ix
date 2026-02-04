import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:ix/features/auth/domain/interfaces/auth_repo.dart';
import 'package:ix/features/auth/presentation/forgetpassword/presentation/set_password_state.dart';

class SetPasswordCubit extends Cubit<SetPasswordState> {
  SetPasswordCubit(this.authRepo)
    : super(SetPasswordState(status: SetPasswordStatus.initial));
  final AuthRepo authRepo;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmedPasswordController = TextEditingController();
  GlobalKey<FormState> setPasswordFormKey = GlobalKey();


  Future<void> createNewPassword({
    required String mobileNumber,
    required String mobileCode,
    required String password,
    required String confirmedPassword,
  }) async {
    emit(state.copyWith(status: SetPasswordStatus.loading));
    final res = await authRepo.createNewPassword(
      mobileNumber: mobileNumber,
      mobileCode: '+${mobileCode}',
      password: password,
      confirmedPassword: confirmedPassword,
    );
    res.fold(
      (left) => emit(
        state.copyWith(
          status: SetPasswordStatus.failure,
          errorMessage: left.errorModel.message,
        ),
      ),
      (user) =>
          emit(state.copyWith(status: SetPasswordStatus.success, user: user)),
    );
  }
}
