import 'package:json_annotation/json_annotation.dart';
import '../../domain/entity/post_entity.dart';
import '../../domain/entity/post_status.dart';
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

  PostEntity toEntity() {
    return PostEntity(
      id: id,
      memberId: author.memberId,
      title: title,
      content: content,
      likes: likeCount,
      status: _parseStatus(status),
      createdAt: DateTime.parse(createdAt),
      updatedAt: DateTime.parse(updatedAt),
      deletedAt: null, // 서버 응답에 없으므로 null 처리
      images: [],      // 아직 이미지 응답 처리 안했으므로 빈 리스트
    );
  }

  PostStatus _parseStatus(String status) {
    try {
      return PostStatus.values.firstWhere(
            (e) => e.name.toUpperCase() == status.toUpperCase(),
      );
    } catch (_) {
      return PostStatus.VISIBLE; // fallback
    }
  }
}
