import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:suitmedia_test/theme.dart';

class PrimaryButton extends StatelessWidget {
  final String textButton;
  PrimaryButton(this.textButton);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 30),
      padding: EdgeInsets.symmetric(vertical: 12.35),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      child: Center(
        child: Text(
          textButton,
          style: buttonTextStyle.copyWith(
            fontWeight: medium,
          ),
        ),
      ),
    );
  }
}
