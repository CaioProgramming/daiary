class NoteBean {
  String title, id, text;
  DateTime date, lastUpdate;
  bool marked;

  factory NoteBean.fromMap(Map<String, dynamic> map, String key) {
    return new NoteBean(
      title: map['noteTitle'] as String,
      id: key,
      text: map['noteText'] as String,
      date: map['noteDate'] as DateTime,
      lastUpdate: map['lastUpdate'] as DateTime,
      marked: map['marked'] as bool,
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
      this.marked,
      this.date,
      DateTime lastUpdate});
}
