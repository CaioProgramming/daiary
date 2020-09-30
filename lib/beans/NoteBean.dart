import 'package:cloud_firestore/cloud_firestore.dart';

class NoteBean {
  String title, id, text;
  DateTime date, lastUpdate;
  bool marked;

  factory NoteBean.fromMap(Map<String, dynamic> map, String key) {
    return new NoteBean(
      title: map['noteTitle'] as String,
      id: key,
      text: map['noteText'] as String,
      date: DateTime.fromMicrosecondsSinceEpoch(
          (map['noteDate'] as Timestamp).microsecondsSinceEpoch),
      lastUpdate: DateTime.fromMicrosecondsSinceEpoch(
          (map['lastUpdate'] as Timestamp).microsecondsSinceEpoch),
      marked: map['marked'] as bool ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'noteTitle': this.title,
      'noteText': this.text,
      'noteDate': this.date,
      'lastUpdate': this.lastUpdate,
      'marked': this.marked,
    };
  }

  NoteBean(
      {this.title,
      this.id,
      this.text,
      this.marked = false,
      this.date,
      DateTime lastUpdate});
}
