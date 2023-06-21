import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Giriş yap fonksiyonu
  Future<User?> singIn(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }

  //Çıkış yap fonksiyonu
  signOut() async {
    return await _auth.signOut();
  }

  //Kayıt ol fonksiyonu
  Future<User?> createUser(
      String userName, String email, String password) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _firestore
        .collection('Users')
        .doc(user.user?.uid)
        .set({'userName': userName, 'email': email});

    return user.user;
  }
}
