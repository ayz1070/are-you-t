package study.are_you_t_springboot.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import study.are_you_t_springboot.dto.comment.*;
import study.are_you_t_springboot.entity.Comment;
import study.are_you_t_springboot.entity.Member;
import study.are_you_t_springboot.entity.Post;
import study.are_you_t_springboot.exception.NotFoundException;
import study.are_you_t_springboot.repository.CommentRepository;
import study.are_you_t_springboot.repository.MemberRepository;
import study.are_you_t_springboot.repository.PostRepository;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional
public class CommentService {

    private final CommentRepository commentRepository;
    private final PostRepository postRepository;
    private final MemberRepository memberRepository;

    /** 댓글 생성 */
    public CommentResponse createComment(Long postId, Long memberId, CreateCommentRequest request) {
        // 1️⃣ 댓글이 달릴 게시글을 조회
        Post post = postRepository.findById(postId)
                .orElseThrow(() -> new NotFoundException("해당 게시글을 찾을 수 없습니다."));

        // 2️⃣ 댓글을 작성할 사용자 조회
        Member member = memberRepository.findById(memberId)
                .orElseThrow(() -> new NotFoundException("해당 회원을 찾을 수 없습니다."));

        // 3️⃣ 부모 댓글 조회 (대댓글일 경우)
        Comment parentComment = null;
        if (request.getParentCommentId() != null) {
            parentComment = commentRepository.findById(request.getParentCommentId())
                    .orElseThrow(() -> new NotFoundException("부모 댓글을 찾을 수 없습니다."));
        }

        // 4️⃣ DTO → Entity 변환 및 저장
        Comment comment = request.toEntity(post, member, parentComment);
        commentRepository.save(comment);

        return CommentResponse.fromEntity(comment);
    }

    /** ✅ 특정 게시글의 모든 댓글 조회 */
    @Transactional(readOnly = true)
    public List<CommentResponse> getCommentsByPost(Long postId) {
        // 1️⃣ 게시글 조회
        Post post = postRepository.findById(postId)
                .orElseThrow(() -> new NotFoundException("해당 게시글을 찾을 수 없습니다."));

        // 2️⃣ 해당 게시글의 모든 댓글 조회
        List<Comment> comments = commentRepository.findByPostOrderByCreatedAtAsc(post);

        return comments.stream()
                .map(CommentResponse::fromEntity)
                .collect(Collectors.toList());
    }

    /** ✅ 댓글 수정 */
    public CommentResponse updateComment(Long commentId, UpdateCommentRequest request) {
        // 1️⃣ 댓글 조회
        Comment comment = commentRepository.findById(commentId)
                .orElseThrow(() -> new NotFoundException("해당 댓글을 찾을 수 없습니다."));

        // 2️⃣ DTO → Entity 업데이트
        request.updateEntity(comment);
        commentRepository.save(comment);

        return CommentResponse.fromEntity(comment);
    }

    /** ✅ 댓글 삭제 (소프트 삭제) */
    public void deleteComment(Long commentId) {
        // 1️⃣ 댓글 조회
        Comment comment = commentRepository.findById(commentId)
                .orElseThrow(() -> new NotFoundException("해당 댓글을 찾을 수 없습니다."));

        // 2️⃣ 소프트 삭제 처리
        comment.setDeletedAt(java.time.LocalDateTime.now());
        commentRepository.save(comment);
    }

    /** ✅ 특정 사용자가 작성한 모든 댓글 조회 */
    @Transactional(readOnly = true)
    public List<CommentResponse> getCommentsByUser(Long memberId) {
        Member member = memberRepository.findById(memberId)
                .orElseThrow(() -> new NotFoundException("해당 회원을 찾을 수 없습니다."));

        List<Comment> comments = commentRepository.findByMemberOrderByCreatedAtAsc(member);

        return comments.stream()
                .map(CommentResponse::fromEntity)
                .collect(Collectors.toList());
    }

    /** ✅ 댓글 강제 삭제 (완전 삭제) */
    public void forceDeleteComment(Long commentId) {
        Comment comment = commentRepository.findById(commentId)
                .orElseThrow(() -> new NotFoundException("해당 댓글을 찾을 수 없습니다."));

        commentRepository.delete(comment); // 완전 삭제
    }
}