import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // To check if the user is logged in or not - Checking the state
  Stream<String> get onAuthStateChanged => _firebaseAuth.onAuthStateChanged.map(
        (FirebaseUser user) => user?.uid,
      );

  Future<String> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    await updateUserName(name, authResult.user);
    return authResult.user.uid;
  }

  Future updateUserName(String name, FirebaseUser currentUser) async {
    var userUpdateInfo = UserUpdateInfo();
    userUpdateInfo.displayName = name;
    await currentUser.updateProfile(userUpdateInfo);
    await currentUser.reload();
  }

  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    return (await _firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password))
        .user
        .uid;
  }

  signOut() {
    return _firebaseAuth.signOut();
  }

  Future sendPasswordResetEmail(String email) async {
    return _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}

class UserManagement {
  storeNewUser(String email, String uid, String role, context) {
    Firestore.instance.collection('/user').add({
      'email': email,
      'uid': uid,
      'role': role,
    }).catchError((e) {
      print(e);
    });
  }
}

int authorizeAccess(BuildContext context) {
  FirebaseAuth.instance.currentUser().then((user) {
    Firestore.instance
        .collection('/users')
        .where('uid', isEqualTo: user.uid)
        .getDocuments()
        .then((docs) {
      if (docs.documents[0].exists) {
        if (docs.documents[0].data['role'] == 'municpal') {
          return 0;
        } else {
          return 1;
        }
      }
    });
  });
}

class EmailValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Email can't be empty";
    }
    return null;
  }
}

class PasswordValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Password can't be empty";
    }
    return null;
  }
}

class NameValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Name can't be empty";
    }
    if (value.length < 4) {
      return "Name must be at least 4 characters long";
    }
    if (value.length > 30) {
      return "Name must maximum 30 characters long";
    }
    return null;
  }
}
