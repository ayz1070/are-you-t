package study.are_you_t_springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import study.are_you_t_springboot.entity.Member;
import study.are_you_t_springboot.entity.type.Provider;

import java.util.Optional;

import java.util.UUID;

@Repository
public interface MemberRepository extends JpaRepository<Member, UUID> {
    Optional<Member> findByNickname(String nickname);  // 닉네임 중복 검사
    Optional<Member> findBySocialIdAndProvider(String socialId, Provider provider);  // 소셜 로그인 중복 검사
    Optional<Member> findByEmail(String email);  // 이메일 중복 검사 (일반 로그인)
}