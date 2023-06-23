import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes_app/models/userModel.dart';

class FirebaseHelper {
  static Future<LocalUser?> getUserModelById(String uid) async {
    LocalUser? localUser;

    DocumentSnapshot snap =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();
    if (snap.data() != null) {
      localUser = LocalUser.fromMap(snap.data() as Map<String, dynamic>);
    }
    return localUser;
  }
}
