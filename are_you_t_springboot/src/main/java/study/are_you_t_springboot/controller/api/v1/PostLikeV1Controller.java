package study.are_you_t_springboot.controller.api.v1;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import study.are_you_t_springboot.dto.post.PostLikeRequest;
import study.are_you_t_springboot.dto.post.PostLikeResponse;
import study.are_you_t_springboot.service.PostLikeService;

@Tag(name= "게시판 좋아요 API_V1", description = "게시판 좋아요 관련 API")
@RestController
@RequestMapping("/api/v1/posts/like")
@RequiredArgsConstructor
public class PostLikeV1Controller {

    private final PostLikeService postLikeService;

    /** ✅ 게시글 좋아요 토글 */
    @PostMapping
    public ResponseEntity<PostLikeResponse> togglePostLike(@RequestBody PostLikeRequest request) {
        PostLikeResponse response = postLikeService.togglePostLike(request);
        return ResponseEntity.ok(response);
    }
}