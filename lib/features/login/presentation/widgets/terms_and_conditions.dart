import 'package:doctor_appointment/core/themes/text_styles.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "By logging, you agree to our ",
            style: TextStyles.font13GrayRegular,
          ),
          TextSpan(
            text: "Terms & Conditions ",
            style: TextStyles.font13DarkBlueMedium,
          ),
          TextSpan(
            text: "\nand ",
            style: TextStyles.font13GrayRegular.copyWith(height: 1.5),
          ),
          TextSpan(
            text: "Privacy Policy",
            style: TextStyles.font13DarkBlueMedium,
          ),
        ],
      ),
    );
  }
}
