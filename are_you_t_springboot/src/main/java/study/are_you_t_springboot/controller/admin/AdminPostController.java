package study.are_you_t_springboot.controller.admin;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import study.are_you_t_springboot.dto.post.CreatePostRequest;
import study.are_you_t_springboot.service.PostService;

@Controller
@RequestMapping("/admin/posts")
@RequiredArgsConstructor
public class AdminPostController {

    private final PostService postService;

    /** ✅ 게시글 목록 페이지 */
    @GetMapping
    public String getPostList(Model model) {
        model.addAttribute("posts", postService.getAllPosts());
        return "admin/post-list";
    }

    @GetMapping("/create")
    public String createPostForm(Model model) {
        model.addAttribute("post", new CreatePostRequest());

        // ✅ 기본적으로 관리자 계정의 ID를 사용하거나, 세션에서 불러오기
        Long defaultAdminId = 1L;  // 예제용 (적절한 방식으로 설정 필요)
        model.addAttribute("memberId", defaultAdminId);

        return "admin/post-form";
    }

    @PostMapping("/create")
    public String createPost(@ModelAttribute CreatePostRequest request, @RequestParam(required = false) Long memberId) {
        if (memberId == null) {
            throw new IllegalArgumentException("회원 ID가 필요합니다.");
        }
        postService.createPost(request, memberId);
        return "redirect:/admin/posts";
    }

    /** ✅ 게시글 삭제 */
    @PostMapping("/delete/{postId}")
    public String deletePost(@PathVariable Long postId) {
        postService.deletePost(postId);
        return "redirect:/admin/posts";
    }
}