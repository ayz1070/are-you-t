package study.are_you_t_springboot.dto.comment;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;
import study.are_you_t_springboot.entity.Comment;

@Getter
@Setter
public class UpdateCommentRequest {

    @NotBlank(message = "댓글 내용을 입력해주세요.")
    private String content;

    // ✅ Request 데이터를 기존 Entity에 반영
    public void updateEntity(Comment comment) {
        comment.updateContent(content);
    }
}