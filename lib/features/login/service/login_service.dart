import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final uid = userCredential.user!.uid;
    final userDoc = await _firestore.collection('users').doc(uid).get();

    if (!userDoc.exists) {
      throw Exception('User data not found in Firestore.');
    }

    final userData = userDoc.data()!;
    return {
      'uid': uid,
      'email': userCredential.user!.email,
      'phoneNumber': userData['phoneNumber'],
      'displayName': userData['displayName'] ?? '',
    };
  }
}
