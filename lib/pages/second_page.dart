import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:suitmedia_test/theme.dart';
import 'package:suitmedia_test/widget/primary_button.dart';

class SecondPage extends StatelessWidget {
  final String selectedUser;
  SecondPage(this.selectedUser);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      appBar: AppBar(
        backgroundColor: backgroundColor1,
        shape: Border(bottom: BorderSide(color: Color(0xFFE2E3E4), width: 1)),
        elevation: 0,
        /* ... */
        // elevation: BorderSide.strokeAlignCenter,
        centerTitle: true,
        title: Text(
          'Second Screen',
          style: primaryTextStyle.copyWith(
            fontWeight: semibold,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: secondaryColor,
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 21, right: 21, top: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome",
                    style: primaryTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    selectedUser,
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Text(
                "Selected User Name",
                style: primaryTextStyle.copyWith(
                  fontWeight: semibold,
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: GestureDetector(
                child: PrimaryButton('Choose a User'),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/third');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
