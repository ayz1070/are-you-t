import 'package:json_annotation/json_annotation.dart';
import 'author_response_dto.dart';

part 'post_response_dto.g.dart';


@JsonSerializable()
class PostResponseDto {
  final int id;
  final String title;
  final String content;
  final int likeCount;
  final int commentCount;
  final String status;
  final String createdAt;
  final String updatedAt;
  final AuthorResponseDto author;

  PostResponseDto({
    required this.id,
    required this.title,
    required this.content,
    required this.likeCount,
    required this.commentCount,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.author,
  });

  // JSON → DTO 변환
  factory PostResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PostResponseDtoFromJson(json);

  // DTO → JSON 변환
  Map<String, dynamic> toJson() => _$PostResponseDtoToJson(this);

}
