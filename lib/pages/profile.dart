import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/Screens/login.dart';
import 'package:provider/provider.dart';

import '../providers/UserProvider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void logOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
        context, CupertinoPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    UserProvider userProvider = Provider.of(context);
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onHorizontalDragUpdate: (details) {
          int sensitivity = 8;
          if (details.delta.dx > sensitivity) {
            Navigator.pop(context);
          }
        },
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: SizedBox(
              width: maxWidth,
            )),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  width: 1,
                ),
              ),
              child: const Icon(
                Icons.person,
                size: 50,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              child: Text(
                userProvider.localUser!.userid,
                style: TextStyle(fontSize: 30),
              ),
            ),
            const Expanded(child: SizedBox()),
            ElevatedButton(
                onPressed: () async {
                  logOut();
                },
                child: Text("log out")),
            const SizedBox(
              height: 5,
            ),
            Text("v1.0.0"),
          ],
        ),
      ),
    );
  }
}
