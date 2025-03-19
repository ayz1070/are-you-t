package study.are_you_t_springboot.dto.post;

import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import study.are_you_t_springboot.entity.Post;
import study.are_you_t_springboot.entity.type.PostStatus;

@Getter
@Setter
public class UpdatePostStatusRequest {

    @NotNull(message = "게시글 상태는 필수 입력값입니다.")
    private PostStatus status;

    /** ✅ Request 데이터를 기존 Entity에 반영 */
    public void updateEntity(Post post) {
        post.setStatus(status);
    }
}