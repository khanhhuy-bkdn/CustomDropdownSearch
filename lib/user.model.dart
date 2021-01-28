import 'package:json_annotation/json_annotation.dart';
//part 'user.model.g.dart';

@JsonSerializable()
class UserModel {
  String id;
  DateTime createdAt;
  String name;
  String avatar;

  UserModel({this.avatar, this.createdAt, this.id, this.name});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  static List<UserModel> fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => UserModel.fromJson(item)).toList();
  }

  bool isEqual(UserModel model) {
    return this?.id == model?.id;
  }

  String userAsString() {
    return '#${this.id} ${this.name}';
  }

  bool userFilterByCreationDate(String filter) {
    return this?.createdAt?.toString()?.contains(filter);
  }

  @override
  String toString() => name;
}

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    avatar: json['avatar'] as String,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    id: json['id'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'name': instance.name,
      'avatar': instance.avatar,
    };
