package study.are_you_t_springboot.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import study.are_you_t_springboot.dto.post.PostLikeRequest;
import study.are_you_t_springboot.dto.post.PostLikeResponse;
import study.are_you_t_springboot.entity.Member;
import study.are_you_t_springboot.entity.Post;
import study.are_you_t_springboot.entity.PostLike;
import study.are_you_t_springboot.exception.NotFoundException;
import study.are_you_t_springboot.repository.MemberRepository;
import study.are_you_t_springboot.repository.PostLikeRepository;
import study.are_you_t_springboot.repository.PostRepository;

import java.util.Optional;

@Service
@RequiredArgsConstructor
@Transactional
public class PostLikeService {

    private final PostLikeRepository postLikeRepository;
    private final PostRepository postRepository;
    private final MemberRepository memberRepository;

    /** 좋아요 토글 기능 */
    public PostLikeResponse togglePostLike(PostLikeRequest request) {
        // 게시글 및 회원 검증
        Post post = postRepository.findById(request.getPostId())
                .orElseThrow(() -> new NotFoundException("게시글을 찾을 수 없습니다."));
        Member member = memberRepository.findById(request.getMemberId())
                .orElseThrow(() -> new NotFoundException("회원 정보를 찾을 수 없습니다."));

        // 사용자가 이미 좋아요를 눌렀는지 확인
        Optional<PostLike> existingLike = postLikeRepository.findByPostAndMember(post, member);

        if (existingLike.isPresent()) {
            // 이미 좋아요가 존재하면 삭제 (좋아요 취소)
            postLikeRepository.delete(existingLike.get());
            post.decreaseLikeCount();
            return new PostLikeResponse(false, post.getLikeCount());
        } else {
            // 좋아요 추가
            PostLike postLike = PostLike.builder()
                    .post(post)
                    .member(member)
                    .build();
            postLikeRepository.save(postLike);
            post.increaseLikeCount();
            return new PostLikeResponse(true, post.getLikeCount());
        }
    }
}