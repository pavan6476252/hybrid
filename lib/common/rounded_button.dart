import 'package:flutter/material.dart';
import 'package:hybrid/theme/color_pallet.dart';

class RoundedsmallButton extends StatelessWidget {
  final VoidCallback ontap;
  final String label;
  final Color backgroundColor;
  final Color textColor;
  const RoundedsmallButton(
      {super.key,
      required this.ontap,
      required this.label,
      this.backgroundColor = Pallet.black,
      this.textColor = Pallet.white});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(fontSize: 16),
      ),
      labelPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
    );
  }
}
