class Branches {
  int? id;
  int? headquarterId;
  String? name;
  int? isActive;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Branches(
      {this.id,
      this.headquarterId,
      this.name,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Branches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    headquarterId = json['headquarter_id'];
    name = json['name'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['headquarter_id'] = headquarterId;
    data['name'] = name;
    data['is_active'] = isActive;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
