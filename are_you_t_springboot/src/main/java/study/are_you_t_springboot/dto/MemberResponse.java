package study.are_you_t_springboot.dto;

import lombok.Builder;
import lombok.Data;
import study.are_you_t_springboot.entity.type.MbtiType;
import study.are_you_t_springboot.entity.type.Role;
import study.are_you_t_springboot.entity.type.MemberStatus;

import java.util.UUID;

@Data
@Builder
public class MemberResponse {
    private UUID id;
    private String nickname;
    private MbtiType mbti;
    private String profileImageUrl;
    private Role role;
    private MemberStatus status;
}