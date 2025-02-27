class UserEntity {
  final String userId;
  final String email;
  final String nickname;
  final String mbti;
  final String profileImage;

  final String? provider;           // 소셜 로그인 제공자 (google, facebook, apple 등)
  final String? providerId;         // 소셜 로그인 고유 식별자

  // 회원 상태 및 역할 관리
  final DateTime? createdAt;        // 가입 날짜
  final DateTime? updatedAt;        // 최근 업데이트 날짜
  final String? gender;             // 성별 (선택)

  UserEntity({
    required this.userId,
    required this.email,
    required this.nickname,
    required this.mbti,
    required this.profileImage,
    this.provider,
    this.providerId,
    this.createdAt,
    this.updatedAt,
    this.gender,
  });

  UserEntity copyWith({
    String? userId,
    String? email,
    String? nickname,
    String? mbti,
    String? profileImage,
    String? provider,
    String? providerId,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? gender,
  }) {
    return UserEntity(
      userId: userId ?? this.userId,
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