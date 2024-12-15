
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lpr/presentation/screens/login/widgets/custom_logo.dart';
import 'package:lpr/presentation/screens/login/widgets/custom_text_field.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/icons/custom_icons.dart';
import '../../../injection_container.dart';
import '../../../logic/login/login_cubit.dart';
import '../../../logic/login/login_state.dart';
import '../../utils/message_dialog.dart';
import '../../widgets/powered_by.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'LoginScreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {

          if (state is LoginSuccessState) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          }
          if (state is LoginErrorState) {
            showMessageDialog(
                context: context,
                isSucceeded: false,
                message: state.message,
               );
          }
        },
        builder: (context, state) {
          var _cubit = LoginCubit.get(context);
          return Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    const CustomLPRLogo(),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
                      child: Form(
                          key: _formKey,
                          child: Column(children: <Widget>[
                            CustomTextFormField(
                              maxLines: 1,
                              prefixIcon: Icon(
                                CustomIcons.user_info,
                                size: 20.r,
                              ),
                              contentPadding:  EdgeInsets.symmetric(vertical:20.h,horizontal: 10.w),
                              labelText: AppStrings.userNumber.tr(),
                              hintText: "45629438",
                              keyboardType: TextInputType.number,
                              controller: _cubit.userNumberController,
                              suffixIconConstraints: BoxConstraints(
                                  maxHeight: 60.h, minWidth: 50.w),
                              prefixIconConstraints: BoxConstraints(
                                  minHeight: 20.h, minWidth: 40.w),
                              // textInputFormatter: [
                              // FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                              // ],
                              obscureText: false,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomTextFormField(
                              contentPadding:  EdgeInsets.symmetric(vertical:20.h,horizontal: 10.w),
                              maxLines: 1,
                              prefixIcon: Icon(
                                CustomIcons.lock2,
                                size: 20.r,
                              ),
                              suffixIcon: Material(
                                color: Colors.transparent,
                                type: MaterialType.circle,
                                clipBehavior: Clip.antiAlias,
                                borderOnForeground: true,
                                elevation: 0,
                                child: IconButton(
                                  onPressed: () {},
                                  icon:
                                      !_cubit.isTextVisible
                                      ? Icon(
                                      Icons.visibility_off_outlined,
                                      size: 20.r,
                                      )
                                          :
                                      Icon(
                                    Icons.remove_red_eye_outlined,
                                    size: 20.r,
                                  ),
                                ),
                              ),
                              labelText: AppStrings.password.tr(),
                              hintText: AppStrings.enterYourPassword.tr(),
                              keyboardType: TextInputType.visiblePassword,
                              controller: _cubit.passwordController,
                              suffixIconConstraints: BoxConstraints(
                                  minHeight: 50.h, minWidth: 50.w),
                              prefixIconConstraints: BoxConstraints(
                                  minHeight: 20.h, minWidth: 40.w),
                              // obscureText: false,
                              obscureText: !_cubit.isTextVisible,
                            ),
                            SizedBox(
                              height: 55.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  _cubit.login();

                                }
                              },
                              child: Container(
                                height: 60.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    color: AppColors.mainColor),
                                child: Center(
                                  child: Text(
                                    AppStrings.login.tr(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Certa Sans",
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20.sp),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 60.h,
                            )
                          ])),
                    ),
                    PoweredByCemex()
                  ],
                ),
              )));
        },
      ),
    );
  }
}
