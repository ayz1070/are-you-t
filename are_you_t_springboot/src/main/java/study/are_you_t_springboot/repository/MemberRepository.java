package study.are_you_t_springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import study.are_you_t_springboot.entity.Member;
import study.are_you_t_springboot.entity.type.Provider;

import java.util.Optional;

public interface MemberRepository extends JpaRepository<Member, Long> {

    Optional<Member> findByEmail(String email);

    Optional<Member> findBySocialIdAndProvider(String socialId, Provider provider);

    boolean existsByNickname(String nickname);

    boolean existsByEmail(String email);

    Optional<Member> findById(Long id); // 예외 처리를 위한 사용
}
