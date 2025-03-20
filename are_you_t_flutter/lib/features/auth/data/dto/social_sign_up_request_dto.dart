import 'package:json_annotation/json_annotation.dart';

part 'social_sign_up_request_dto.g.dart';

@JsonSerializable()
class SocialSignUpRequestDto {
  final String provider;
  final String socialId;
  final String nickname;
  final String profileImageUrl;
  final String mbti;

  SocialSignUpRequestDto({
    required this.provider,
    required this.socialId,
    required this.nickname,
    required this.profileImageUrl,
    required this.mbti,
  });

  factory SocialSignUpRequestDto.fromJson(Map<String, dynamic> json) => _$SignUpRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpRequestDtoToJson(this);
}