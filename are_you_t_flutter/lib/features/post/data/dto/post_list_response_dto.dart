import 'package:json_annotation/json_annotation.dart';
import '../../domain/entity/post_entity.dart';
import '../../domain/entity/post_status.dart';
import 'author_response_dto.dart';

part 'post_list_response_dto.g.dart';

@JsonSerializable()
class PostListResponseDto {
  final int postId;
  final String title;
  final String contentPreview;
  final int likeCount;
  final int commentCount;
  final String createdAt; // 날짜 포맷 그대로 받아오기
  final AuthorResponseDto author;

  PostListResponseDto({
    required this.postId,
    required this.title,
    required this.contentPreview,
    required this.likeCount,
    required this.commentCount,
    required this.createdAt,
    required this.author,
  });

  /// **JSON → DTO 변환**
  factory PostListResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PostListResponseDtoFromJson(json);

  /// **DTO → JSON 변환**
  Map<String, dynamic> toJson() => _$PostListResponseDtoToJson(this);

  PostEntity toEntity() {
    return PostEntity(
      id: postId.toString(),
      memberId: author.memberId.toString(),
      title: title,
      content: contentPreview,
      likes: likeCount,
      status: PostStatus.visible,
      createdAt: DateTime.parse(createdAt),
      updatedAt: DateTime.parse(createdAt),
    );
  }
}

