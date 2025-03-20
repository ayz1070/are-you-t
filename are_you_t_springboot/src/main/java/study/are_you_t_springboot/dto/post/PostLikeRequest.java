package study.are_you_t_springboot.dto.post;

import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PostLikeRequest {

    @NotNull(message = "게시글 ID는 필수입니다.")
    private Long postId;

    @NotNull(message = "회원 ID는 필수입니다.")
    private Long memberId;
}