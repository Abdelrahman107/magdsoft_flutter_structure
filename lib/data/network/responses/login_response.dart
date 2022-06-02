// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.status,
    required this.account,
  });

  int status;
  List<Account> account;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        status: json["status"],
        account:
            List<Account>.from(json["account"].map((x) => Account.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "account": List<dynamic>.from(account.map((x) => x.toJson())),
      };
}

class Account {
  Account({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.updatedAt,
    required this.createdAt,
  });

  int id;
  String name;
  String email;
  String password;
  String phone;
  DateTime updatedAt;
  DateTime createdAt;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
      };
}
