import 'package:doctor_appointment/core/helpers/extensions.dart';
import 'package:doctor_appointment/core/routing/routes.dart';
import 'package:doctor_appointment/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_appointment/features/login/logic/cubit/login_cubit.dart';
import 'package:doctor_appointment/features/login/logic/cubit/login_state.dart';

import '../../../../core/themes/text_styles.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Success || current is Loading || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: AppColors.mainBlue),
              ),
            );
          },
          success: (loginResponse) {
            context.pop();
            context.pushNamed(Routes.homeScreen);
          },
          error: (error) {
            context.pop();
            // Show error message
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: AppColors.darkBlue,
                title: Text('Error', style: TextStyle(color: Colors.red)),
                content: Text(error, style: TextStyles.font16WhiteSemiBold),
                actions: [
                  TextButton(
                    onPressed: () => context.pop(),
                    child: Text(
                      'Got it!',
                      style: TextStyles.font16WhiteSemiBold,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
