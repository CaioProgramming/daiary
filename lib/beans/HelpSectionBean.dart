class HelpSectionBean {
  String title, description, id;

  HelpSectionBean({this.title, this.description, this.id});

  factory HelpSectionBean.fromMap(Map<String, dynamic> map, String id) {
    return new HelpSectionBean(
      title: map['title'] as String,
      description: map['description'] as String,
      id: id,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'title': this.title,
      'description': this.description,
    } as Map<String, dynamic>;
  }
}
