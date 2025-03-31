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

  @JsonKey(name: 'likesCount', defaultValue: 0)
  final int likeCount;

  @JsonKey(name: 'commentsCount', defaultValue: 0)
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

  factory PostResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PostResponseDtoFromJson(json);

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
      deletedAt: null,
      images: [],
    );
  }

  PostStatus _parseStatus(String status) {
    try {
      return PostStatus.values.firstWhere(
            (e) => e.name.toUpperCase() == status.toUpperCase(),
      );
    } catch (_) {
      return PostStatus.VISIBLE;
    }
  }
}