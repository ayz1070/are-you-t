//package study.are_you_t_springboot.controller.admin;
//
//import lombok.RequiredArgsConstructor;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.*;
//import study.are_you_t_springboot.dto.comment.CommentResponse;
//import study.are_you_t_springboot.dto.comment.CreateCommentRequest;
//import study.are_you_t_springboot.service.CommentService;
//
//import java.util.List;
//
//@Controller
//@RequestMapping("/admin/comments")
//@RequiredArgsConstructor
//public class AdminCommentController {
//
//    private final CommentService commentService;
//
//    /** ✅ 댓글 목록 페이지 */
//    @GetMapping
//    public String getAllComments(Model model) {
//        List<CommentResponse> comments = commentService.getAllComments();
//        model.addAttribute("comments", comments);
//        return "admin/comment-list";
//    }
//
//    /** ✅ 댓글 작성 폼 */
//    @GetMapping("/create")
//    public String showCreateCommentForm(Model model) {
//        model.addAttribute("comment", new CreateCommentRequest());
//        return "admin/comment-form";
//    }
//
//    /** ✅ 댓글 생성 */
//    @PostMapping("/create")
//    public String createComment(@ModelAttribute CreateCommentRequest request) {
//        commentService.createComment(request.getPostId(), request.getMemberId(), request);
//        return "redirect:/admin/comments";
//    }
//
//    /** ✅ 댓글 삭제 */
//    @PostMapping("/delete/{id}")
//    public String deleteComment(@PathVariable Long id) {
//        commentService.forceDeleteComment(id);
//        return "redirect:/admin/comments";
//    }
//}