import 'package:doctor_appointment/features/login/presentation/widgets/password_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../logic/cubit/login_cubit.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text.trim());
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text.trim());
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(
          passwordController.text.trim(),
        );
        hasNumber = AppRegex.hasNumber(passwordController.text.trim());
        hasMinLength = AppRegex.hasMinLength(passwordController.text.trim());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Email',
            controller: context.read<LoginCubit>().emailController,
            validator: (email) {
              if (email == null ||
                  email.isEmpty ||
                  !AppRegex.isEmailValid(email)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          Gap(30.h),
          AppTextFormField(
            hintText: 'Password',
            isObscureText: isObscureText,
            controller: context.read<LoginCubit>().passwordController,
            validator: (password) {
              if (password == null || password.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          Gap(24.h),
          PasswordValidation(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
