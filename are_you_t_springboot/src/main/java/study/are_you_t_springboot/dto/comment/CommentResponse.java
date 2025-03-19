package study.are_you_t_springboot.dto.comment;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import study.are_you_t_springboot.entity.Comment;
import study.are_you_t_springboot.entity.type.CommentStatus;

import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
public class CommentResponse {

    private Long id;
    private Long postId;
    private Long parentCommentId;
    private String content;
    private String authorNickname;
    private boolean isEdited;
    private CommentStatus status;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private LocalDateTime deletedAt;

    // ✅ Entity → Response 변환
    public static CommentResponse fromEntity(Comment comment) {
        return new CommentResponse(
                comment.getId(),
                comment.getPost().getId(),
                comment.getParentComment() != null ? comment.getParentComment().getId() : null,
                comment.getContent(),
                comment.getMember().getNickname(),
                comment.isEdited(),
                comment.getStatus(),
                comment.getCreatedAt(),
                comment.getUpdatedAt(),
                comment.getDeletedAt()
        );
    }
}