class UserModel {
  final String login;
  final String nickName;
  final String password;

  UserModel({
    required this.login,
    required this.nickName,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'login': login,
      'nickName': nickName,
      'password': password,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      login: map['login'] ?? '',
      nickName: map['nickName'] ?? '',
      password: map['password'] ?? '',
    );
  }

  @override
  String toString() {
    return 'UserModel{login: $login, nickName: $nickName, password: $password,}';
  }
}
