import '../../../../core/constants/social_provider.dart';

class UserEntity {
  final String id;
  final String email;
  final String nickname;
  final String mbti;
  final String profileImage;

  // SocialProvider enum 타입으로 변경
  final SocialProvider provider;
  final String? providerId;

  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? gender;

  UserEntity({
    required this.id,
    required this.email,
    required this.nickname,
    required this.mbti,
    required this.profileImage,
    required this.provider,
    this.providerId,
    this.createdAt,
    this.updatedAt,
    this.gender,
  });

  UserEntity copyWith({
    String? id,
    String? email,
    String? nickname,
    String? mbti,
    String? profileImage,
    SocialProvider? provider,
    String? providerId,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? gender,
  }) {
    return UserEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      nickname: nickname ?? this.nickname,
      mbti: mbti ?? this.mbti,
      profileImage: profileImage ?? this.profileImage,
      provider: provider ?? this.provider,
      providerId: providerId ?? this.providerId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      gender: gender ?? this.gender,
    );
  }
}