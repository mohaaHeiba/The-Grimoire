class UserModel {
  late final String _uid;
  late final String _firstName;
  late final String _lastName;
  late final String _email;

  UserModel(this._uid, this._firstName, this._lastName, this._email);

  // Setters
  set firstName(String firstName) {
    _firstName = firstName;
  }

  set lastName(String lastName) {
    _lastName = lastName;
  }

  set email(String email) {
    final hasGmail = RegExp(r'@gmail\.com$');
    if (hasGmail.hasMatch(email)) {
      _email = email;
    } else {
      throw Exception("should have in end gmail.com");
    }
  }

  // Getters
  String get uid => _uid;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get fullName => "$_firstName $_lastName";
  String get email => _email;

  // Conver data of usermodel to map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['uid'] ?? '',
      map['firstName'] ?? '',
      map['lastName'] ?? '',
      map['email'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
    };
  }
}
