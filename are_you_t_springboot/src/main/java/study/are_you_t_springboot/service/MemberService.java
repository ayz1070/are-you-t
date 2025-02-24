package study.are_you_t_springboot.service;


import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import study.are_you_t_springboot.dto.MemberResponse;
import study.are_you_t_springboot.dto.SignUpRequest;
import study.are_you_t_springboot.entity.Member;
import study.are_you_t_springboot.entity.type.MemberStatus;
import study.are_you_t_springboot.entity.type.Provider;
import study.are_you_t_springboot.entity.type.Role;
import study.are_you_t_springboot.repository.MemberRepository;

@Service
public class MemberService {

    private final MemberRepository memberRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    public MemberService(MemberRepository memberRepository) {
        this.memberRepository = memberRepository;
        this.passwordEncoder = new BCryptPasswordEncoder();
    }

    // 소셜 로그인
    @Transactional
    public MemberResponse signUpWithSocial(SignUpRequest requestDto) {
        // 닉네임 중복 검사
        memberRepository.findByNickname(requestDto.getNickname()).ifPresent(existingMember -> {
            throw new IllegalArgumentException("이미 존재하는 닉네임입니다.");
        });

        // 소셜 ID와 Provider 중복 檢事
        memberRepository.findBySocialIdAndProvider(requestDto.getSocialId(), requestDto.getProvider())
                .ifPresent(existingMember -> {
                    throw new IllegalArgumentException("이미 가입된 소셜 계정입니다.");
                });

        // Member Entity 생성 및 저장
        Member member = Member.builder()
                .socialId(requestDto.getSocialId())
                .provider(requestDto.getProvider())
                .nickname(requestDto.getNickname())
                .mbti(requestDto.getMbti())
                .profileImageUrl(requestDto.getProfileImageUrl())
                .role(Role.USER)
                .status(MemberStatus.ACTIVE)
                .build();

        Member savedMember = memberRepository.save(member);

        // Entity → DTO 변환 후 반환
        return MemberResponse.builder()
                .id(savedMember.getId())
                .nickname(savedMember.getNickname())
                .mbti(savedMember.getMbti())
                .profileImageUrl(savedMember.getProfileImageUrl())
                .role(savedMember.getRole())
                .status(savedMember.getStatus())
                .build();
    }

    /// 이메일 회원
    @Transactional
    public MemberResponse signUpWithEmail(SignUpRequest requestDto) {
        // 닉네임 중복 검사
        memberRepository.findByNickname(requestDto.getNickname()).ifPresent(existingMember -> {
            throw new IllegalArgumentException("이미 존재하는 닉네임입니다.");
        });

        // 이메일 중복 검사
        memberRepository.findByEmail(requestDto.getEmail()).ifPresent(existingMember -> {
            throw new IllegalArgumentException("이미 가입된 이메일입니다.");
        });

        // 비밀번호 암호화
        String encodedPassword = passwordEncoder.encode(requestDto.getPassword());

        // Member Entity 생성 및 저장
        Member member = Member.builder()
                .email(requestDto.getEmail())
                .password(encodedPassword)
                .nickname(requestDto.getNickname())
                .mbti(requestDto.getMbti())
                .profileImageUrl(requestDto.getProfileImageUrl())
                .provider(Provider.EMAIL)
                .role(Role.USER)
                .status(MemberStatus.ACTIVE)
                .build();

        Member savedMember = memberRepository.save(member);

        // Entity → DTO 변환 후 반환
        return MemberResponse.builder()
                .id(savedMember.getId())
                .nickname(savedMember.getNickname())
                .mbti(savedMember.getMbti())
                .profileImageUrl(savedMember.getProfileImageUrl())
                .role(savedMember.getRole())
                .status(savedMember.getStatus())
                .build();
    }
}