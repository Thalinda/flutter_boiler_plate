import 'dart:convert';

class UserModel {
  UserModel({
    required this.userid,
    required this.email,
    required this.token,
    required this.isMobile,
  });

  int userid;
  String email;
  String token;
  bool isMobile;

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userid: json["userid"],
        email: json["email"],
        token: json["token"],
        isMobile: json["isMobile"],
      );

  Map<String, dynamic> toJson() => {
        "userid": userid,
        "email": email,
        "token": token,
        "isMobile": isMobile,
      };
}
