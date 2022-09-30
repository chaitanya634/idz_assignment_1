const String tableUsers = 'users';

class UserModel {
  final int? id;
  final String name;
  final DateTime birthDate;
  final String emailId;

  const UserModel({
    this.id,
    required this.name,
    required this.birthDate,
    required this.emailId,
  });

  static UserModel fromJson(Map<String, Object?> json) => UserModel(
    id: json[UserFields.id] as int?,
    name: json[UserFields.name] as String,
    birthDate: DateTime.parse(json[UserFields.birthDate] as String),
    emailId: json[UserFields.emailId] as String ,

    );

  Map<String, Object?> toJson() => {
        UserFields.id: id,
        UserFields.name: name,
        UserFields.birthDate: birthDate.toIso8601String(),
        UserFields.emailId: emailId
      };

  UserModel copy({
    int? id,
    String? name,
    DateTime? birthDate,
    String? emailId,
  }) =>
      UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        birthDate: birthDate ?? this.birthDate,
        emailId: emailId ?? this.emailId,
      );
}

class UserFields {
  static const String id = '_id';
  static const String name = 'name';
  static const String birthDate = 'birthDate';
  static const String emailId = 'emailId';

  static const List<String> values = [id, name, birthDate, emailId];
}
