import 'package:json_annotation/json_annotation.dart';

part 'author_response_dto.g.dart';

@JsonSerializable()
class AuthorResponseDto {
  final int memberId;
  final String nickname;
  final String mbti;
  final String profileImageUrl;

  AuthorResponseDto({
    required this.memberId,
    required this.nickname,
    required this.mbti,
    required this.profileImageUrl,
  });

  /// **JSON → DTO 변환**
  factory AuthorResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AuthorResponseDtoFromJson(json);

  /// **DTO → JSON 변환**
  Map<String, dynamic> toJson() => _$AuthorResponseDtoToJson(this);
}