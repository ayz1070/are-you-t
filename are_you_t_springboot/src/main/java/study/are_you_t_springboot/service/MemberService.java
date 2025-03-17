package study.are_you_t_springboot.service;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import study.are_you_t_springboot.dto.member.MemberResponse;
import study.are_you_t_springboot.dto.member.SocialSignUpRequest;
import study.are_you_t_springboot.entity.Member;
import study.are_you_t_springboot.entity.type.MemberStatus;
import study.are_you_t_springboot.repository.MemberRepository;
import study.are_you_t_springboot.exception.DuplicateResourceException;
import study.are_you_t_springboot.exception.ResourceNotFoundException;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class MemberService {

    private final MemberRepository memberRepository;

    /** ✅ 전체 회원 목록 조회 */
    public List<MemberResponse> getAllMembers() {
        return memberRepository.findAll()
                .stream()
                .map(MemberResponse::fromEntity)
                .collect(Collectors.toList());
    }

    /** ✅ 회원 등록 */
    @Transactional
    public MemberResponse signUpWithSocial(SocialSignUpRequest request) {
        if (memberRepository.existsByNickname(request.getNickname())) {
            throw new DuplicateResourceException("이미 사용 중인 닉네임입니다.");
        }

        Member member = request.toEntity();
        memberRepository.save(member);
        return MemberResponse.fromEntity(member);
    }

    /** ✅ 회원 조회 */
    public MemberResponse getMemberById(Long id) {
        Member member = memberRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("회원 정보를 찾을 수 없습니다."));
        return MemberResponse.fromEntity(member);
    }

    /** ✅ 회원 삭제 (소프트 삭제 적용) */
    @Transactional
    public void deleteMember(Long memberId) {
        Member member = memberRepository.findById(memberId)
                .orElseThrow(() -> new ResourceNotFoundException("회원 정보를 찾을 수 없습니다."));

        member.setStatus(MemberStatus.DEACTIVATED);  // 계정 비활성화
        memberRepository.save(member);  // 업데이트
    }
}
