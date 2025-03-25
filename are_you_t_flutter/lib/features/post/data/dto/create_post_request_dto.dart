import 'package:json_annotation/json_annotation.dart';

part 'create_post_request_dto.g.dart';
// dart pub run build_runner build
@JsonSerializable()
class CreatePostRequestDto {
  final String title;
  final String content;

  CreatePostRequestDto({
    required this.title,
    required this.content,
  });

  // JSON → DTO 변환
  factory CreatePostRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CreatePostRequestDtoFromJson(json);

  // DTO → JSON 변환
  Map<String, dynamic> toJson() => _$CreatePostRequestDtoToJson(this);

}
