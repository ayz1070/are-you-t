package study.are_you_t_springboot.dto.post;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class PostLikeResponse {

    private boolean isLiked; // 사용자가 현재 좋아요를 눌렀는지 여부
    private int likeCount;   // 현재 게시글의 총 좋아요 개수
}