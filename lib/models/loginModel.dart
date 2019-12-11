class LoginModel {
  final String email;
  final String password;
  final String access_token;

  LoginModel(this.email, this.password, this.access_token);

  LoginModel.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'],
        access_token = json['access_token'];
        

  Map<String, dynamic> toJson() =>
      {
        "email": email,
        "password": password,
        "access_token": access_token
      };
}