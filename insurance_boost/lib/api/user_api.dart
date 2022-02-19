import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class UserApi {
  final String uid;

  UserApi(this.uid);

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('user');

  // when users modify their info again
  Future updateUserInfo(
      String username, String email, String profileUrl, String bio) async {
    return userCollection
        .doc(uid)
        .update({
          'username': username,
          'email': email,
          'profileUrl': profileUrl,
          'bio': bio,
        })
        .then((value) => print('User $uid Update'))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future addUserToStore() async {
    String username = 'Username';
    String email = 'email@email.com';
    String profileUrl =
        'gs://insurance-boost-26d35.appspot.com/default/profile_default.png';
    String bio = 'Say something?';
    return userCollection.doc(uid).set({
      'username': username,
      'email': email,
      'profileUrl': profileUrl,
      'bio': bio,
    });
  }
}
