class Note {
  final int id;
  final String title;
  final String content;
  final DateTime createdDate;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.createdDate,
  });

  // JSON formatiga o'tkazish
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'createdDate': createdDate.toIso8601String(),
    };
  }

  // JSON formatidan Note obyektiga o'tkazish
  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      createdDate: DateTime.parse(json['createdDate']),
    );
  }
}