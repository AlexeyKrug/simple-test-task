import 'package:json_annotation/json_annotation.dart';
part 'users_response.g.dart';

@JsonSerializable()
class UserResponse {
  String? login;
  @JsonKey(name:'avatar_url')
  String? avatarUrl;
  @JsonKey(name:'followers_url')
  String? followersUrl;
  @JsonKey(name:'following_url')
  String? followingUrl;

  UserResponse({this.login, this.avatarUrl, this.followersUrl, this.followingUrl});

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}



