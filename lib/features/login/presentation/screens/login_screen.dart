import 'package:doctor_appointment/core/themes/text_styles.dart';
import 'package:doctor_appointment/features/login/data/models/login_request_body.dart';
import 'package:doctor_appointment/features/login/presentation/widgets/already_have_an_account.dart';
import 'package:doctor_appointment/features/login/presentation/widgets/login_bloc_listener.dart';
import 'package:doctor_appointment/features/login/presentation/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/widgets/app_text_button.dart';
import '../../logic/cubit/login_cubit.dart';
import '../widgets/email_and_password.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome Back', style: TextStyles.font24BlueBold),
                  Gap(8.h),
                  Text(
                    "We're excited to have you back, can't wait to \n see what you've been up to since you last \n logged in.",

                    style: TextStyles.font14GrayRegular,
                  ),
                  Gap(60.h),
                  Column(
                    children: [
                      EmailAndPassword(),
                      Gap(15.h),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyles.font13BlueRegular,
                        ),
                      ),
                      Gap(40.h),
                      AppTextButton(
                        buttonText: 'Login',
                        onPressed: () {
                          validateThenLogin(context);
                        },
                        textStyle: TextStyles.font16WhiteSemiBold,
                      ),
                      Gap(30.h),

                      const TermsAndConditions(),

                      Gap(80.h),
                      const AlreadyHaveAnAccount(),
                      const LoginBlocListener(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateThenLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates(
        LoginRequestBody(
          email: context.read<LoginCubit>().emailController.text.trim(),
          password: context.read<LoginCubit>().passwordController.text.trim(),
        ),
      );
    }
  }
}
