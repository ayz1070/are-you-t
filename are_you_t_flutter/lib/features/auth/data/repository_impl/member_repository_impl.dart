
import '../../domain/entity/user_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/member_data_source.dart';
import '../dto/member_dto.dart';
import '../dto/social_sign_up_request_dto.dart';

class MemberRepositoryImpl implements MemberRepository {
  final MemberDataSource _dataSource;

  MemberRepositoryImpl({required MemberDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future<UserEntity> signUpWithSocial({
    required String nickname,
    required String mbti,
    required String profileImagePath,
  }) async {
    final dto = SocialSignUpRequestDto(
      nickname: nickname,
      mbti: mbti,
      profileImageUrl: profileImagePath,
    );

    final MemberDto response = await _dataSource.signUpWithSocial(dto);
    return response.toEntity(); // DTO → Entity 변환
  }

  @override
  Future<UserEntity> fetchMember(int memberId) async {
    final MemberDto response = await _dataSource.fetchMember(memberId);
    return response.toEntity(); // DTO → Entity 변환
  }

  @override
  Future<void> deleteMember(int memberId) async {
    await _dataSource.deleteMember(memberId);
  }
}