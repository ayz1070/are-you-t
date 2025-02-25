import '../entity/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> signUpWithEmail(String email, String password, UserEntity userEntity);
  Future<UserEntity> signInWithEmail(String email, String password);
}