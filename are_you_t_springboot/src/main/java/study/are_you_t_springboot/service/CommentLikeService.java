package study.are_you_t_springboot.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import study.are_you_t_springboot.dto.comment.CommentLikeRequest;
import study.are_you_t_springboot.dto.comment.CommentLikeResponse;
import study.are_you_t_springboot.entity.Comment;
import study.are_you_t_springboot.entity.CommentLike;
import study.are_you_t_springboot.entity.Member;
import study.are_you_t_springboot.exception.NotFoundException;
import study.are_you_t_springboot.repository.CommentLikeRepository;
import study.are_you_t_springboot.repository.CommentRepository;
import study.are_you_t_springboot.repository.MemberRepository;

import java.util.Optional;

@Service
@RequiredArgsConstructor
@Transactional
public class CommentLikeService {

    private final CommentLikeRepository commentLikeRepository;
    private final CommentRepository commentRepository;
    private final MemberRepository memberRepository;

    /** ✅ 댓글 좋아요 토글 기능 */
    public CommentLikeResponse toggleCommentLike(CommentLikeRequest request) {
        // 댓글 및 회원 검증
        Comment comment = commentRepository.findById(request.getCommentId())
                .orElseThrow(() -> new NotFoundException("댓글을 찾을 수 없습니다."));
        Member member = memberRepository.findById(request.getMemberId())
                .orElseThrow(() -> new NotFoundException("회원 정보를 찾을 수 없습니다."));

        // 사용자가 이미 좋아요를 눌렀는지 확인
        Optional<CommentLike> existingLike = commentLikeRepository.findByCommentAndMember(comment, member);

        if (existingLike.isPresent()) {
            // 이미 좋아요가 존재하면 삭제 (좋아요 취소)
            commentLikeRepository.delete(existingLike.get());
            comment.decreaseLikeCount();
            return new CommentLikeResponse(false, comment.getLikeCount());
        } else {
            // 좋아요 추가
            CommentLike commentLike = CommentLike.builder()
                    .comment(comment)
                    .member(member)
                    .build();
            commentLikeRepository.save(commentLike);
            comment.increaseLikeCount();
            return new CommentLikeResponse(true, comment.getLikeCount());
        }
    }
}