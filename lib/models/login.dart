class LoginModel {
  final String userName;
  final String password;
  final bool isMobile;

  LoginModel({
    required this.userName,
    required this.password,
    required this.isMobile,
  });

  LoginModel.fromJson(Map<String, dynamic> json)
      : userName = json['userName'],
        password = json['password'],
        isMobile = json['isMobile'];

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'password': password,
        'isMobile': isMobile,
      };
}
