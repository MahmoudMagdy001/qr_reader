// ignore_for_file: avoid_classes_with_only_static_members

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class QRHistoryService {
  static final _collection = FirebaseFirestore.instance.collection(
    'scan_results',
  );

  static Future<void> addCode(String code) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    await _collection.add({
      'result': code,
      'type': code.startsWith('http') ? 'url' : 'text',
      'timestamp': FieldValue.serverTimestamp(),
      'user_id': user.uid,
    });
  }

  static Stream<QuerySnapshot> userCodesStream() {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return const Stream.empty();

    return _collection
        .where('user_id', isEqualTo: user.uid)
        .limit(10)
        .snapshots();
  }

  static Future<void> deleteCode(String docId) async {
    await _collection.doc(docId).delete();
  }
}
