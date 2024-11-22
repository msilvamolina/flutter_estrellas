import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_estrellas/app/data/models/bank_account/bank_account_model.dart';
import 'package:get/get.dart';

class BankAccountsRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = Get.find<FirebaseFirestore>();

  Map<String, String> getUidAndEmail() {
    User? currentUser = _firebaseAuth.currentUser;

    if (currentUser != null) {
      String uid = currentUser.uid;
      String? email = currentUser.email; // Email puede ser nulo

      return {
        'uid': uid,
        'email': email ?? 'No email found' // Evitar valores nulos
      };
    } else {
      return {'uid': 'No UID found', 'email': 'No email found'};
    }
  }

  Stream<List<BankAccountModel>> getUserBankAccounts() async* {
    Map<String, String> userData = getUidAndEmail();
    String uid = userData['uid'] ?? '';
    try {
      Stream<QuerySnapshot> snapshots = _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('bank_accounts')
          .orderBy('createdAt', descending: true)
          .snapshots();

      yield* snapshots.map((snapshot) {
        return snapshot.docs
            .map((doc) => BankAccountModel.fromDocument(doc))
            .toList();
      });
    } catch (e) {
      print(e);
    }
  }

  Future<Either<String, Unit>> addBankAccount({
    required BankAccountModel bankAccount,
  }) async {
    Map<String, String> userData = getUidAndEmail();
    String uid = userData['uid'] ?? '';

    try {
      await _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('bank_accounts')
          .doc(bankAccount.id)
          .set({
        'id': bankAccount.id,
        'bank': bankAccount.bank,
        'accountType': bankAccount.accountType,
        'accountNumber': bankAccount.accountNumber,
        'fullname': bankAccount.fullname,
        'documentType': bankAccount.documentType,
        'document': bankAccount.document,
        'createdAt': DateTime.now(),
      });

      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code);
    }
  }
}
