import 'package:flutter/material.dart';

import '../../../../core/functions/inputs_func.dart';
import '../../../core_widgets/custom_form_field.dart';

class UserProfileInputs extends StatelessWidget {
  final TextEditingController feildController;

  final String Function(String?)? validFunc;
  final void Function()? fieldTapFunc ;

  final String label;
  final IconData? icon ;
final bool readOnly ;
  const UserProfileInputs(
      {super.key,
      required this.feildController,
        required this.validFunc,
      required this.label, this.icon, this.fieldTapFunc, this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        CostumFormField(
          onTapFunc: fieldTapFunc,
          readOnly: readOnly,
          sufIcon: icon,
          secure: false,
          validFunc: validFunc,
          feildController: feildController,
        )
      ],
    );
  }
}