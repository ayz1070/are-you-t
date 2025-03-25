import 'package:json_annotation/json_annotation.dart';

part 'post_like_response_dto.g.dart';

@JsonSerializable()
class PostLikeResponseDto {
  final bool isLiked;
  final int likeCount;

  PostLikeResponseDto({
    required this.isLiked,
    required this.likeCount,
  });

  // JSON → DTO 변환
  factory PostLikeResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PostLikeResponseDtoFromJson(json);

  // DTO → JSON 변환
  Map<String, dynamic> toJson() => _$PostLikeResponseDtoToJson(this);
}
