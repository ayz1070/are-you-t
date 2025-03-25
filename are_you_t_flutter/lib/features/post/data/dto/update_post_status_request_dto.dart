import 'package:json_annotation/json_annotation.dart';

part 'update_post_status_request_dto.g.dart';

@JsonSerializable()
class UpdatePostStatusRequestDto {
  final String status;

  UpdatePostStatusRequestDto({
    required this.status,
  });

  // JSON → DTO 변환
  factory UpdatePostStatusRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UpdatePostStatusRequestDtoFromJson(json);

  // DTO → JSON 변환
  Map<String, dynamic> toJson() => _$UpdatePostStatusRequestDtoToJson(this);
}
