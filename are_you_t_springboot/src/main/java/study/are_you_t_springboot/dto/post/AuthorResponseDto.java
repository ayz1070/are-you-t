package study.are_you_t_springboot.dto.post;

import lombok.*;
import study.are_you_t_springboot.entity.Member;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AuthorResponseDto {
    private Long memberId;
    private String nickname;
    private String mbti;
    private String profileImageUrl;

    public AuthorResponseDto(Member member) {
        this.memberId = member.getId();
        this.nickname = member.getNickname();
        this.mbti = member.getMbti().toString();
        this.profileImageUrl = member.getProfileImageUrl();
    }

    // Entity → DTO 변환 메서드 추가
    public static AuthorResponseDto fromEntity(Member member) {
        return AuthorResponseDto.builder()
                .memberId(member.getId())
                .nickname(member.getNickname())
                .mbti(member.getMbti().name())
                .profileImageUrl(member.getProfileImageUrl())
                .build();
    }
}