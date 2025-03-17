package study.are_you_t_springboot.dto.member;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import study.are_you_t_springboot.entity.Member;
import study.are_you_t_springboot.entity.type.MbtiType;
import study.are_you_t_springboot.entity.type.Provider;
import study.are_you_t_springboot.entity.type.Role;
import study.are_you_t_springboot.entity.type.MemberStatus;

@Getter
@Setter
public class SocialSignUpRequest {

    @NotBlank(message = "로그인 제공자는 필수입니다.")
    private Provider provider;  // 소셜 로그인 또는 이메일 회원가입

    @NotBlank(message = "소셜 ID는 필수입니다.")
    private String socialId;  // 소셜 로그인 사용자 필수

    @NotBlank(message = "닉네임은 필수입니다.")
    @Size(min = 2, max = 20, message = "닉네임은 2자 이상 20자 이하로 입력하세요.")
    private String nickname;  // 닉네임

    private String profileImageUrl;  // 선택적 (기본값 지정 가능)

    @NotBlank(message = "MBTI는 필수입니다.")
    private MbtiType mbti;  // MBTI 타입

    // SocialSignUpRequest → Member 변환
    public Member toEntity() {
        return Member.builder()
                .provider(provider)
                .socialId(socialId)
                .nickname(nickname)
                .profileImageUrl(profileImageUrl != null ? profileImageUrl : "https://example.com/default-profile.jpg")
                .mbti(mbti)
                .role(Role.USER)  // 기본값 USER
                .status(MemberStatus.ACTIVE)  // 기본값 ACTIVE
                .build();
    }
}
