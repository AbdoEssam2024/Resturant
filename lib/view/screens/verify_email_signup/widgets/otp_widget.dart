import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:resturant_anj/core/constant/colors/app_colors.dart';
import 'package:resturant_anj/core/constant/theme/opt_style.dart';

class OtpWidget extends StatelessWidget {
  final void Function(String) onSubmitCode;

  const OtpWidget({super.key, required this.onSubmitCode});

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      numberOfFields: 6,
      styles: otpTextStyles,
      showFieldAsBox: false,
      margin: EdgeInsets.symmetric(horizontal: 10),
      enabledBorderColor: AppColors.grey,
      borderWidth: 3.0,
      onSubmit: onSubmitCode,
      clearText: true,
    );
  }
}
