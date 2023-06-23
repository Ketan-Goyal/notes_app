import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/models/firebaseHelper.dart';
import '../models/userModel.dart';

class UserProvider with ChangeNotifier {
  User? user;
  LocalUser? localUser;

  UserProvider() {
    fetchLocalUser();
  }
  String fetchUserId() {
    return user!.uid;
  }

  void fetchLocalUser() async {
    user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      localUser = await FirebaseHelper.getUserModelById(user!.uid);
    }
  }
}
