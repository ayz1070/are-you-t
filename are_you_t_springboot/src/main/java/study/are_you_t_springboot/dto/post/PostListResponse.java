package study.are_you_t_springboot.dto.post;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import study.are_you_t_springboot.entity.Post;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PostListResponse {
    private Long postId;
    private String title;
    private String contentPreview;  // ✨ 전체 내용이 아닌 미리보기 (100자 제한)
    private int likeCount;
    private int commentCount;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm")  // ✨ 날짜 포맷 적용
    private LocalDateTime createdAt;

    private AuthorResponseDto author;

    // Entity → DTO 변환 메서드 추가
    public static PostListResponse fromEntity(Post post) {
        return PostListResponse.builder()
                .postId(post.getId())
                .title(post.getTitle())
                .contentPreview(post.getContent().length() > 100 ? post.getContent().substring(0, 100) + "..." : post.getContent()) // 100자 미리보기
                .likeCount(post.getLikeCount())
                .commentCount(post.getCommentCount())  // ✨ 댓글 수 별도 계산
                .createdAt(post.getCreatedAt())
                .author(AuthorResponseDto.fromEntity(post.getMember()))  // ✨ 작성자 정보 변환
                .build();
    }
}