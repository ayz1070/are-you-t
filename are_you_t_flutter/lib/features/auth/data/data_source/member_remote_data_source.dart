import 'dart:convert';
import 'package:dio/dio.dart';

import '../dto/member_dto.dart';
import '../dto/social_sign_up_request_dto.dart';
import 'member_data_source.dart';

class RemoteMemberDataSource implements MemberDataSource {
  final Dio dio;

  RemoteMemberDataSource({required String baseUrl})
      : dio = Dio(BaseOptions(
    baseUrl: baseUrl, // ✅ baseUrl 직접 설정
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    responseType: ResponseType.json, // ✅ JSON 응답 명시
    headers: {'Content-Type': 'application/json'},
  ));

  @override
  Future<MemberDto> signUpWithSocial(SocialSignUpRequestDto request) async {
    try {
      final response = await dio.post(
        '/api/v1/members/signup/social',
        data: request.toJson(),
      );

      return MemberDto.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(_handleDioError(e, '회원가입 실패'));
    }
  }

  @override
  Future<MemberDto> fetchMember(int memberId) async {
    try {
      final response = await dio.get('/api/v1/members/$memberId');

      return MemberDto.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(_handleDioError(e, '회원 정보 조회 실패'));
    }
  }

  @override
  Future<void> deleteMember(int memberId) async {
    try {
      final response = await dio.delete('/api/v1/members/$memberId');
      if (response.statusCode != 200) {
        throw Exception('회원 삭제 실패: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception(_handleDioError(e, '회원 삭제 실패'));
    }
  }

  // ✅ 에러 메시지를 처리하는 함수 추가
  String _handleDioError(DioException e, String defaultMessage) {
    if (e.response != null) {
      switch (e.response?.statusCode) {
        case 400:
          return '$defaultMessage: 잘못된 요청입니다.';
        case 401:
          return '$defaultMessage: 인증되지 않은 사용자입니다.';
        case 403:
          return '$defaultMessage: 권한이 없습니다.';
        case 404:
          return '$defaultMessage: 요청한 데이터를 찾을 수 없습니다.';
        case 500:
          return '$defaultMessage: 서버 오류가 발생했습니다.';
      }
    }
    return '$defaultMessage: ${e.message}';
  }
}