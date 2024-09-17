import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_data/user_data.dart';

class DocumentHelpers {
  static Future<DocumentSnapshot> getDocumentFromReference(
          DocumentReference docRef) async =>
      await docRef.get().then((DocumentSnapshot doc) => doc);

  static Future<UserData> getUserFromReference(dynamic ref) async {
    DocumentSnapshot doc = await getDocumentFromReference(ref);
    return UserData.fromDocument(doc);
  }
}
