package study.are_you_t_springboot.dto.post;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import study.are_you_t_springboot.entity.Post;
import study.are_you_t_springboot.entity.type.PostStatus;

import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
public class PostResponse {

    private Long id;
    private String title;
    private String content;
    private String authorNickname;
    private int likesCount;
    private int commentsCount;
    private PostStatus status;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    /** ✅ Entity → Response 변환 */
    public static PostResponse fromEntity(Post post) {
        return new PostResponse(
                post.getId(),
                post.getTitle(),
                post.getContent(),
                post.getMember().getNickname(),
                post.getLikesList().size(),
                post.getComments().size(),
                post.getStatus(),
                post.getCreatedAt(),
                post.getUpdatedAt()
        );
    }
}