package study.are_you_t_springboot.dto.comment;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;
import study.are_you_t_springboot.entity.Comment;
import study.are_you_t_springboot.entity.Member;
import study.are_you_t_springboot.entity.Post;

@Getter
@Setter
public class CreateCommentRequest {

    private Long parentCommentId; // 대댓글 여부

    @NotBlank(message = "댓글 내용을 입력해주세요.")
    private String content;

    // ✅ Request → Entity 변환
    public Comment toEntity(Post post, Member member, Comment parentComment) {
        return Comment.builder()
                .post(post)
                .member(member)
                .parentComment(parentComment) // 부모 댓글 (null이면 최상위 댓글)
                .content(content)
                .status(null) // @PrePersist에서 기본값 설정됨
                .isEdited(false)
                .build();
    }
}