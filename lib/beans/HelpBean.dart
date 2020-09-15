class HelpBean {
  String id, title, description, background;

  factory HelpBean.fromMap(Map<String, dynamic> map, String key) {
    return new HelpBean(
      id: key,
      title: map['title'] as String,
      description: map['description'] as String,
      background: map['background'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'description': this.description,
      'background': this.background,
    };
  }

  HelpBean({this.id, this.title, this.description, this.background});
}
