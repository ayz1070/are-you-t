package study.are_you_t_springboot.dto.post;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import study.are_you_t_springboot.entity.Post;
import study.are_you_t_springboot.entity.type.PostStatus;

import java.time.LocalDateTime;

@Getter
@AllArgsConstructor
public class PostResponse {

    private Long id;
    private String title;
    private String content;
    private AuthorResponseDto author; // 확장된 author 객체
    private int likesCount;
    private int commentsCount;
    private PostStatus status;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    public static PostResponse fromEntity(Post post) {
        return new PostResponse(
                post.getId(),
                post.getTitle(),
                post.getContent(),
                new AuthorResponseDto(post.getMember()),
                post.getLikesList().size(),
                post.getComments().size(),
                post.getStatus(),
                post.getCreatedAt(),
                post.getUpdatedAt()
        );
    }
}