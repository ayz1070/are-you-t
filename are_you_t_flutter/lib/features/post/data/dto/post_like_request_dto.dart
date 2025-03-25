import 'package:json_annotation/json_annotation.dart';

part 'post_like_request_dto.g.dart';

@JsonSerializable()
class PostLikeRequestDto {
  final int postId;
  final int memberId;

  PostLikeRequestDto({
    required this.postId,
    required this.memberId,
  });

  // JSON → DTO 변환
  factory PostLikeRequestDto.fromJson(Map<String, dynamic> json) =>
      _$PostLikeRequestDtoFromJson(json);

  // DTO → JSON 변환
  Map<String, dynamic> toJson() => _$PostLikeRequestDtoToJson(this);
}
