import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

abstract class BaseData {
  final firestoreInstance = Firestore.instance;

  StreamBuilder<QuerySnapshot> defaultBuilder(Stream stream,
      {@required Widget emptyResult});

  CollectionReference collectionReference();

  Stream query({@required String field, @required String value}) =>
      collectionReference().where(field, isEqualTo: value).snapshots();

  Future<DocumentSnapshot> singleDocument(String key) async =>
      await collectionReference().document(key).get();

  Stream defaultStream() {
    return collectionReference().snapshots();
  }

  Map<dynamic, dynamic> getSnapshotMap(
      List<DocumentSnapshot> documents, int index) {
    return documents[index].data;
  }
}
