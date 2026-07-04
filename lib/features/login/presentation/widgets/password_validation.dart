import 'package:doctor_appointment/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/themes/text_styles.dart';

class PasswordValidation extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;
  const PasswordValidation({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow(
          text: 'At least one lowercase letter',
          condition: hasLowerCase,
        ),
        Gap(10.h),
        buildValidationRow(
          text: 'At least one uppercase letter',
          condition: hasUpperCase,
        ),
        Gap(10.h),
        buildValidationRow(
          text: 'At least one special character',
          condition: hasSpecialCharacters,
        ),
        Gap(10.h),
        buildValidationRow(text: 'At least one number', condition: hasNumber),
        Gap(10.h),
        buildValidationRow(
          text: 'At least 8 characters',
          condition: hasMinLength,
        ),
      ],
    );
  }

  Widget buildValidationRow({required String text, required bool condition}) {
    return Row(
      children: [
        Icon(
          condition ? Icons.check : Icons.circle,
          size: 10.sp,
          color: condition ? Colors.green : AppColors.gray,
        ),
        Gap(6.w),
        Text(
          text,
          style: TextStyles.font13DarkBlueRegular.copyWith(
            decoration: condition
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            color: condition ? Colors.green : AppColors.darkBlue,
            decorationColor: condition ? Colors.green : AppColors.darkBlue,
          ),
        ),
      ],
    );
  }
}
