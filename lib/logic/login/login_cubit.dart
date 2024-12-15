import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/app_constants.dart';
import '../../data/repositories/usr_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  static LoginCubit get(context) => BlocProvider.of(context);
  final UserRepository userRepository;

  LoginCubit({required this.userRepository}) : super(InitialLoginState());

  TextEditingController userNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isTextVisible = false;

  void changeTextVisibility(bool value) {
    isTextVisible = value;
    emit(ChangePasswordVisibilityState());
  }


  Future<void> login() async {
    emit(LoginLoadingState());
    final result = await userRepository.loginUser(
        userNumber: int.parse(userNumberController.text.toString()),
        password:passwordController.text.toString(),
        languageCode:2);
    result.fold((failure) {
      emit(LoginErrorState(failure.message));
    }, (loginResponse) {
      userNumber=loginResponse;
      emit(LoginSuccessState());
    });
  }

}
