package study.are_you_t_springboot.controller.api.v1;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import study.are_you_t_springboot.dto.comment.CommentResponse;
import study.are_you_t_springboot.dto.comment.CreateCommentRequest;
import study.are_you_t_springboot.dto.comment.UpdateCommentRequest;
import study.are_you_t_springboot.service.CommentService;

import java.util.List;

@Tag(name= "댓글 API_V1", description = "댓글 관련 API")
@RestController
@RequestMapping("/api/v1/comments")
@RequiredArgsConstructor
public class CommentV1Controller {

    private final CommentService commentService;

    /** 댓글 생성 */
    @PostMapping
    public ResponseEntity<CommentResponse> createComment(
            @RequestParam Long postId,
            @RequestParam Long memberId,
            @RequestBody CreateCommentRequest request) {
        CommentResponse response = commentService.createComment(postId, memberId, request);
        return ResponseEntity.ok(response);
    }

    /** 특정 게시글의 모든 댓글 조회 */
    @GetMapping("/post/{postId}")
    public ResponseEntity<List<CommentResponse>> getCommentsByPost(@PathVariable Long postId) {
        List<CommentResponse> responses = commentService.getCommentsByPost(postId);
        return ResponseEntity.ok(responses);
    }

    /** 댓글 수정 */
    @PutMapping("/{commentId}")
    public ResponseEntity<CommentResponse> updateComment(
            @PathVariable Long commentId,
            @RequestBody UpdateCommentRequest request) {
        CommentResponse response = commentService.updateComment(commentId, request);
        return ResponseEntity.ok(response);
    }

    /** 댓글 삭제 (사용자는 소프트 삭제) */
    @DeleteMapping("/{commentId}")
    public ResponseEntity<Void> deleteComment(@PathVariable Long commentId) {
        commentService.deleteComment(commentId);
        return ResponseEntity.noContent().build();
    }
}