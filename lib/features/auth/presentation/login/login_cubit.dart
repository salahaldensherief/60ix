import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ix/features/auth/domain/interfaces/auth_repo.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  LoginCubit({required this.authRepo})
    : super(LoginState(status: LoginStatus.initial));
  GlobalKey<FormState> signInFormKey = GlobalKey();
  TextEditingController signInPhoneNumber = TextEditingController();
  TextEditingController signInPhoneNCode = TextEditingController(text: "+20");
  TextEditingController signInPassword = TextEditingController();
  Future<void> login({
    required String phone,
    required String password,
    required String mobileCode,
  }) async {
    emit(state.copyWith(status: LoginStatus.loading));
    final user = await authRepo.login(
      mobileCode: mobileCode,
      phone: phone,
      password: password,
    );
    user.fold(
      (left) => emit(
        state.copyWith(
          status: LoginStatus.failure,
          errorMessage: left.errorModel.message,
        ),
      ),
      (user) => emit(state.copyWith(status: LoginStatus.success, user: user)),
    );
  }
}
