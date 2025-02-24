package study.are_you_t_springboot.dto;

import lombok.Data;
import study.are_you_t_springboot.entity.type.MbtiType;
import study.are_you_t_springboot.entity.type.Provider;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@Data
public class SignUpRequest {

    // 공통 필드
    @NotBlank(message = "닉네임은 필수 입력값입니다.")
    private String nickname;

    @NotNull(message = "MBTI는 필수 입력값입니다.")
    private MbtiType mbti;

    private String profileImageUrl;

    // 소셜 로그인 필드
    private String socialId;
    private Provider provider = Provider.EMAIL;

    // 일반 로그인 필드
    @Email(message = "이메일 형식이 올바르지 않습니다.")
    private String email;

    private String password;
}