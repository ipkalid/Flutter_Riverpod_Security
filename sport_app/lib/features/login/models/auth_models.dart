class AuthResponse {
  String? token;
  String? error;
  String? name;

  AuthResponse({this.token, this.error, this.name});

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        token: json["token"],
        error: json["error"],
        name: json["name"],
      );
}

// class AuthLoginBody {
//   String email;
//   String password;

//   AuthLoginBody(this.email, this.password);
// }

class AuthLoginBody {
  String email;
  String password;

  AuthLoginBody({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
