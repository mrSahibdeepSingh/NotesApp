String tableName = 'personal_notes';

class NoteFields {
  static final List<String> values = [
    /// Add all fields
    id, title, description, creationTime
  ];

  static final String id = '_id';
  static final String title = 'title';
  static final String description = 'description';
  static final String creationTime = 'creationTime';
}

class Note {
  int? id;
  String title;
  String description;
  DateTime creationTime;

  Note(
      {this.id,
      required this.title,
      required this.description,
      required this.creationTime});

  Note copy({int? id, String? title, String? description}) => Note(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      creationTime: creationTime);

  Map<String, Object?> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'creationTime': creationTime.toIso8601String(),
      };

  static Note fromjson(Map<String, Object?> map) => Note(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      creationTime: DateTime.parse(map['creationTime'] as String));
}
