import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:the_grimoire/domain/models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerUser(UserModel user, String password) async {
    final cred = await _auth.createUserWithEmailAndPassword(
      email: user.email,
      password: password,
    );
    final fullUser = UserModel(
      cred.user!.uid,
      user.firstName,
      user.lastName,
      user.email,
    );
    await _firestore
        .collection('users')
        .doc(fullUser.uid)
        .set(fullUser.toMap());
  }

  Future<void> loginUser(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> logout() async => await _auth.signOut();

  User? get currentUser => _auth.currentUser;
}
