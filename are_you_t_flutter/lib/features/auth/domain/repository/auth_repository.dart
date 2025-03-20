
import '../entity/user_entity.dart';

abstract class MemberRepository {
  Future<UserEntity> signUpWithSocial({
    required String nickname,
    required String mbti,
    required String profileImagePath,
  });

  Future<UserEntity> fetchMember(int memberId);

  Future<void> deleteMember(int memberId);
}