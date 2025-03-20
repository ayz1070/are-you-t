package study.are_you_t_springboot.dto.comment;

import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CommentLikeRequest {

    @NotNull(message = "댓글 ID는 필수입니다.")
    private Long commentId;

    @NotNull(message = "회원 ID는 필수입니다.")
    private Long memberId;
}