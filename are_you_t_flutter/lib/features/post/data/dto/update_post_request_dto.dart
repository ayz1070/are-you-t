import 'package:json_annotation/json_annotation.dart';
part 'update_post_request_dto.g.dart';

@JsonSerializable()
class UpdatePostRequestDto {
  final String title;
  final String content;

  UpdatePostRequestDto({
    required this.title,
    required this.content,
  });

  // JSON → DTO 변환
  factory UpdatePostRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UpdatePostRequestDtoFromJson(json);

  // DTO → JSON 변환
  Map<String, dynamic> toJson() => _$UpdatePostRequestDtoToJson(this);
}
