import 'package:doctor_appointment/core/themes/text_styles.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Don't have an account? ",
            style: TextStyles.font14GrayRegular,
          ),
          TextSpan(text: "Register Now", style: TextStyles.font13BlueSemiBold),
        ],
      ),
    );
  }
}
