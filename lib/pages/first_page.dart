import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:suitmedia_test/pages/second_page.dart';
import 'package:suitmedia_test/theme.dart';
import 'package:suitmedia_test/widget/primary_button.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController palindromeController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    bool isPalindrome = false;

    Future<void> _dialogBuilder(BuildContext context) {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              isPalindrome ? 'isPalindrome' : 'not Palindrome',
              style: primaryTextStyle.copyWith(
                fontWeight: semibold,
              ),
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: Text(
                  'Close',
                  style: primaryTextStyle.copyWith(
                    color: primaryColor,
                    fontWeight: semibold,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    inputField(String name, TextEditingController textController) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          color: backgroundColor1,
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 16, 0),
          child: TextField(
            controller: textController,
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
            maxLines: 1,
            decoration: InputDecoration(
              hintText: name,
              hintStyle: secondaryTextStyle.copyWith(
                color: secondaryTextColor.withOpacity(0.36),
                fontSize: 16,
                fontWeight: medium,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/image_background.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icon_photo.png",
                width: 116.0,
                height: 116.0,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 51,
              ),
              inputField('Name', nameController),
              SizedBox(
                height: 22,
              ),
              inputField('Palindrome', palindromeController),
              SizedBox(
                height: 45,
              ),
              GestureDetector(
                onTap: () {
                  String? reverse = palindromeController.text
                      .toString()
                      .split('')
                      .reversed
                      .join('');

                  if (palindromeController.text.toString() == reverse) {
                    setState(() {
                      isPalindrome = true;
                    });
                    _dialogBuilder(context);
                  } else {
                    isPalindrome = false;
                    _dialogBuilder(context);
                  }
                },
                child: PrimaryButton("CHECK"),
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                child: PrimaryButton("NEXT"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) =>
                          SecondPage(nameController.text.toString())),
                    ),
                  );
                },
              ),

              // InkWell(
              //   child: PrimaryButton("NEXT"),
              //   onTap: () {},
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
