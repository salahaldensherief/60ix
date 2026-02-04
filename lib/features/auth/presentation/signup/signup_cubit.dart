import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:ix/core/shared_preferences_singleton.dart';
import 'package:ix/features/auth/data/models/register_params.dart';
import 'package:ix/features/auth/domain/interfaces/auth_repo.dart';
import 'package:ix/features/auth/presentation/signup/signup_state.dart';

import '../../../../art_core/utils/constants.dart';
import '../../../../core/flutter_secure_storage.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepo authRepo;
  final LocalSecureStorage? localStorage;

  SignupCubit({required this.authRepo, this.localStorage})
    : super(SignupState(status: SignupStatus.initial));

  GlobalKey<FormState> registerFormKey = GlobalKey();

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileCodeController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  int gender = 1;
  int cityId = 4;
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  void saveStepOneData() {}
  void savePassword(String password, String confirmedPassword) {
    passwordController.text = password;
    passwordConfirmationController.text = confirmedPassword;
  }

  void saveMobileInfo({required String number, required String code}) {
    emit(state.copyWith(mobileNumber: number, mobileCode: code));
  }

  Future<void> register() async {
    emit(state.copyWith(status: SignupStatus.loading));
    Prefs.setString(ConstStrings.mobileCode, mobileCodeController.text);
    Prefs.setString(ConstStrings.mobileNumber, mobileNumberController.text);
    final params = RegisterParams(
      name: nameController.text,
      mobileCode: '+${mobileCodeController.text}',
      mobileNumber: mobileNumberController.text,
      email: emailController.text,
      gender: gender,
      birthDate: birthDateController.text,
      cityId: cityId,
      password: passwordController.text,
      confirmedPassword: passwordConfirmationController.text,
    );
    final userResult = await authRepo.register(params);

    userResult.fold(
      (failure) => emit(
        state.copyWith(
          status: SignupStatus.failure,
          errorMessage: failure.errorModel.message,
        ),
      ),
      (user) => emit(state.copyWith(status: SignupStatus.success, user: user)),
    );
  }
}
