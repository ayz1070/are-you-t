package study.are_you_t_springboot.dto.member;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import study.are_you_t_springboot.entity.type.MbtiType;
import study.are_you_t_springboot.entity.type.Provider;

@Getter
@Setter
public class EmailSignUpRequest {

    @NotBlank(message = "이메일은 필수입니다.")
    @Email(message = "유효한 이메일 주소를 입력하세요.")
    private String email;  // ✅ 이메일 로그인 필수

    @Size(min = 6, message = "비밀번호는 최소 6자 이상이어야 합니다.")
    private String password;  // ✅ 비밀번호 필수

    @NotBlank(message = "닉네임은 필수입니다.")
    @Size(min = 2, max = 20, message = "닉네임은 2자 이상 20자 이하로 입력하세요.")
    private String nickname;  // ✅ 닉네임

    private String profileImageUrl;  // ✅ 선택적 (기본값 설정 가능)

    @NotBlank(message = "MBTI는 필수입니다.")
    private MbtiType mbti;  // ✅ ENUM 타입으로 변경
}
