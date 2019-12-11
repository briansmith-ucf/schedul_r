class JsonUser {
  String email;
  String password;

  JsonUser({
    this.email, this.password
  });

  factory JsonUser.fromJson(Map<String, dynamic> parsedJson) {
    Map json = parsedJson['user'];
    return JsonUser(
      email: json['email'],
      password: json['password']
    );
  }
}