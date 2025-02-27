class UserEntity {
  final String userId;
  final String email;
  final String nickname;
  final String mbti;
  final String profileImage;

  UserEntity({
    required this.userId,
    required this.email,
    required this.nickname,
    required this.mbti,
    required this.profileImage,
  });

  // copyWith 메서드: 불변 객체 관리 (MVVM에서 사용)
  UserEntity copyWith({
    String? userId,
    String? email,
    String? nickname,
    String? mbti,
    String? profileImageUrl,
  }) {
    return UserEntity(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      nickname: nickname ?? this.nickname,
      mbti: mbti ?? this.mbti,
      profileImage: profileImageUrl ?? this.profileImage,
    );
  }
}