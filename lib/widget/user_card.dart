import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test/model/user_model.dart';
import 'package:suitmedia_test/pages/second_page.dart';
import 'package:suitmedia_test/provider/user_provider.dart';
import 'package:suitmedia_test/theme.dart';

class UserCard extends StatelessWidget {
  final UserModel user;
  UserCard(this.user);

  @override
  Widget build(BuildContext context) {
    String name = '${user.firstName} ${user.lastName}';
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => SecondPage(name)),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                // color: primaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(100.0),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    user.avatar!,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.firstName} ${user.lastName}',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                // SizedBox(
                //   height: 4,
                // ),
                Text(
                  user.email!,
                  style: secondaryTextStyle.copyWith(
                    fontSize: 10,
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    ;
  }
}
