package study.are_you_t_springboot.dto.member;

import lombok.Builder;
import lombok.Data;
import study.are_you_t_springboot.entity.Member;
import study.are_you_t_springboot.entity.type.MbtiType;
import study.are_you_t_springboot.entity.type.Role;
import study.are_you_t_springboot.entity.type.MemberStatus;

import java.time.LocalDateTime;
import java.util.UUID;

@Data
@Builder
public class MemberResponse {
    private Long id;
    private String nickname;
    private MbtiType mbti;
    private String profileImageUrl;
    private Role role;
    private MemberStatus status;
    private LocalDateTime createdAt;  // ✅ 필드 추가


    // Member 엔티티 → MemberResponse 변환
    public static MemberResponse fromEntity(Member member) {
        return MemberResponse.builder()
                .id(member.getId())
                .nickname(member.getNickname())
                .mbti(member.getMbti())
                .profileImageUrl(member.getProfileImageUrl())
                .role(member.getRole())
                .createdAt(member.getCreatedAt())  // ✅ 값 매핑 추가
                .status(member.getStatus())
                .build();
    }
}
