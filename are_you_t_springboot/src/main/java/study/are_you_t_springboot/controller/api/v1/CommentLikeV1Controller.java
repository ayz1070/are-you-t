package study.are_you_t_springboot.controller.api.v1;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import study.are_you_t_springboot.dto.comment.CommentLikeRequest;
import study.are_you_t_springboot.dto.comment.CommentLikeResponse;
import study.are_you_t_springboot.service.CommentLikeService;

@RestController
@RequestMapping("/api/v1/comments/like")
@RequiredArgsConstructor
public class CommentLikeV1Controller {

    private final CommentLikeService commentLikeService;

    /** ✅ 댓글 좋아요 토글 */
    @PostMapping
    public ResponseEntity<CommentLikeResponse> toggleCommentLike(@RequestBody CommentLikeRequest request) {
        CommentLikeResponse response = commentLikeService.toggleCommentLike(request);
        return ResponseEntity.ok(response);
    }
}