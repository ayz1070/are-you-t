package study.are_you_t_springboot.dto.comment;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class CommentLikeResponse {
    private boolean isLiked; // 좋아요 여부 (true: 좋아요, false: 좋아요 취소)
    private int likeCount; // 현재 좋아요 개수
}