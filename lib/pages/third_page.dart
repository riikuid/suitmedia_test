import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test/provider/user_provider.dart';
import 'package:suitmedia_test/theme.dart';
import 'package:suitmedia_test/widget/primary_button.dart';
import 'package:suitmedia_test/widget/user_card.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    loadUser() async {
      await Provider.of<UserProvider>(context, listen: false).getUserList();
      setState(() {});
    }

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
          'Third Screen',
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
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            FutureBuilder(
              future: Provider.of<UserProvider>(context, listen: false)
                  .getUserList(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Expanded(
                    child: Center(
                      child: Text('Failed to load User list'),
                    ),
                  );
                } else {
                  return Consumer<UserProvider>(
                      builder: (context, userProvider, _) {
                    if (userProvider.users.isEmpty) {
                      return Expanded(
                        child: Center(
                          child: Text('No User List Found'),
                        ),
                      );
                    } else {
                      return Expanded(
                        child: RefreshIndicator(
                          onRefresh: () {
                            return Future.delayed(Duration(seconds: 1), () {
                              setState(() {
                                loadUser();
                              });
                            });
                          },
                          color: primaryColor,
                          child: ListView.builder(
                            padding: EdgeInsets.only(top: 1),
                            physics: BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics(),
                            ),
                            itemCount: userProvider.users.length,
                            itemBuilder: (context, index) {
                              final user =
                                  userProvider.users.reversed.toList()[index];
                              return Column(
                                children: [
                                  UserCard(user),
                                  Divider(
                                    color: Color(0xFFE2E3E4),
                                    height: 1,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      );
                    }
                  });
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
