class LocalUser {
  final String userid;
  final String email;
  final String name;

  LocalUser({
    required this.email,
    required this.userid,
    required this.name,
  });
  factory LocalUser.fromMap(Map<String, dynamic> map) {
    return LocalUser(
      email: map["email"],
      userid: map["userid"],
      name: map["name"],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "userid": userid,
      "name": name,
      "email": email,
    };
  }
}
