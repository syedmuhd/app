import 'package:app/providers/data/branches.dart';

class User {
  int? id;
  String? phone;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  Null? lastLogin;
  String? createdAt;
  String? updatedAt;
  List<Branches>? branches;

  User(
      {this.id,
      this.phone,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.lastLogin,
      this.createdAt,
      this.updatedAt,
      this.branches});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    lastLogin = json['last_login'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['branches'] != null) {
      branches = <Branches>[];
      json['branches'].forEach((v) {
        branches!.add(Branches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['phone'] = phone;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['last_login'] = lastLogin;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (branches != null) {
      data['branches'] = branches!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
