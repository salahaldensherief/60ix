import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:ix/features/auth/data/models/register_params.dart';
import 'package:ix/features/auth/domain/interfaces/auth_repo.dart';
import 'package:ix/features/auth/presentation/signup/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepo authRepo;

  RegisterCubit({required this.authRepo}) : super(RegisterState());

  GlobalKey<FormState> registerFormKey = GlobalKey();

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileCodeController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  int gender = 1;
  int cityId = 4;
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();

  void saveStepOneData() {}

  void savePassword(String password, String confirmedPassword) {
    passwordController.text = password;
    passwordConfirmationController.text = confirmedPassword;
  }

  Future<void> register() async {
    emit(state.copyWith(status: RegisterStatus.loading));
    final params = RegisterParams(
      name: nameController.text,
      mobileCode: mobileCodeController.text,
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
          (failure) => emit(state.copyWith(
          status: RegisterStatus.failure, errorMessage: failure.errorModel.message)),
          (user) => emit(state.copyWith(status: RegisterStatus.success, user: user)),
    );
  }
}
