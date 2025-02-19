package study.are_you_t_springboot.service;

import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import study.are_you_t_springboot.entity.Member;
import study.are_you_t_springboot.repository.MemberRepository;

@Service
@RequiredArgsConstructor
public class MemberService {

    private final MemberRepository memberRepository;

    public Member findMemberByEmail(String email) {
        return memberRepository.findByEmail(email)
                .orElseThrow(() -> new EntityNotFoundException("해당 이메일을 가진 회원을 찾을 수 없습니다."));
    }
}