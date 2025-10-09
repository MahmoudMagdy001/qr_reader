import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class QRHistoryService {
  QRHistoryService({FirebaseFirestore? firestore, FirebaseAuth? auth})
    : _firestore = firestore ?? FirebaseFirestore.instance,
      _auth = auth ?? FirebaseAuth.instance;

  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  CollectionReference get _collection => _firestore.collection('scan_results');

  Future<void> addCode(String code) async {
    final user = _auth.currentUser;
    if (user == null) return;

    await _collection.add({
      'result': code,
      'type': code.startsWith('http') ? 'url' : 'text',
      'timestamp': FieldValue.serverTimestamp(),
      'user_id': user.uid,
    });
  }

  Stream<QuerySnapshot> userCodesStream() {
    final user = _auth.currentUser;
    if (user == null) return const Stream.empty();

    return _collection.where('user_id', isEqualTo: user.uid).snapshots();
  }

  Future<void> deleteCode(String docId) async {
    await _collection.doc(docId).delete();
  }
}
