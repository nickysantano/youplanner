import 'dart:convert';

class Tasks {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final String userId;
  final bool public;
  Tasks({
    this.id,
    this.title,
    this.description,
    this.date,
    this.userId,
    this.public,
  });

  Tasks copyWith({
    String id,
    String title,
    String description,
    DateTime date,
    String userId,
    bool public,
  }) {
    return Tasks(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      userId: userId ?? this.userId,
      public: public ?? this.public,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date.millisecondsSinceEpoch,
      'userId': userId,
      'public': public,
    };
  }

  factory Tasks.fromMap(Map<String, dynamic> map) {
    return Tasks(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      userId: map['userId'],
      public: map['public'],
    );
  }

  factory Tasks.fromDS(String id, Map<String, dynamic> map) {
    return Tasks(
      id: id,
      title: map['title'],
      description: map['description'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      userId: map['userId'],
      public: map['public'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Tasks.fromJson(String source) => Tasks.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Tasks(id: $id, title: $title, description: $description, date: $date, userId: $userId, public: $public)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Tasks &&
      other.id == id &&
      other.title == title &&
      other.description == description &&
      other.date == date &&
      other.userId == userId &&
      other.public == public;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      date.hashCode ^
      userId.hashCode ^
      public.hashCode;
  }
}
