class Users {
  final String username;
  final String email;
  final String password;
  final String uid;

  Users({
    required this.username,
    required this.email,
    required this.password,
    required this.uid,
  });

  Map<String, dynamic> tojson() => {
        'username': username,
        'password': password,
        'email': email,
        'uid': uid,
      };
}
