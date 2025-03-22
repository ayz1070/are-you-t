package study.are_you_t_springboot.controller.api.v1;

import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.persistence.Table;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import study.are_you_t_springboot.dto.post.*;
import study.are_you_t_springboot.service.PostService;

import java.util.List;

@Tag(name = "게시판 API_V1", description = "게시판 관련 API")
@RestController
@RequestMapping("/api/v1/posts")
@RequiredArgsConstructor
public class PostV1Controller {

    private final PostService postService;

    ///  create : 게시글 생성
    @PostMapping
    public ResponseEntity<PostResponse> createPost(@RequestBody CreatePostRequest request, @RequestParam Long memberId) {
        PostResponse response = postService.createPost(request, memberId);
        return ResponseEntity.ok(response);
    }

    ///  read : id로 게시글 조회
    @GetMapping("/{postId}")
    public ResponseEntity<PostResponse> getPost(@PathVariable Long postId) {
        PostResponse response = postService.getPost(postId);
        return ResponseEntity.ok(response);
    }

    /// read : 모든 게시글 (작성자 포함) 페이징 조회
    @GetMapping
    public ResponseEntity<List<PostListResponse>> getPostsWithAuthor(
            @RequestParam(defaultValue = "0") int page,   // 기본 페이지: 0
            @RequestParam(defaultValue = "10") int size   // 기본 사이즈: 10
    ) {
        List<PostListResponse> responses = postService.getPostsWithAuthor(page, size);
        return ResponseEntity.ok(responses);
    }


    /// update : 특정 게시글 업데이트
    @PutMapping("/{postId}")
    public ResponseEntity<PostResponse> updatePost(
            @PathVariable Long postId,
            @RequestBody UpdatePostRequest request
    ) {
        PostResponse response = postService.updatePost(postId, request);
        return ResponseEntity.ok(response);
    }



    /// update : 특정 게시글 상태 변경
    @PatchMapping("/{postId}/status")
    public ResponseEntity<PostResponse> updatePostStatus(
            @PathVariable Long postId,
            @RequestBody UpdatePostStatusRequest request
    ) {
        PostResponse response = postService.updatePostStatus(postId, request);
        return ResponseEntity.ok(response);
    }

    /// delete : 특정 게시글 삭제
    @DeleteMapping("/{postId}")
    public ResponseEntity<String> deletePost(@PathVariable Long postId) {
        postService.deletePost(postId);
        return ResponseEntity.ok("게시글이 삭제되었습니다.");
    }
}