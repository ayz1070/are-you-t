package study.are_you_t_springboot.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import study.are_you_t_springboot.dto.post.*;
import study.are_you_t_springboot.entity.Member;
import study.are_you_t_springboot.entity.Post;
import study.are_you_t_springboot.exception.NotFoundException;
import study.are_you_t_springboot.repository.MemberRepository;
import study.are_you_t_springboot.repository.PostRepository;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional
public class PostService {

    private final PostRepository postRepository;
    private final MemberRepository memberRepository;

    /** ✅ 게시글 생성 */
    public PostResponse createPost(CreatePostRequest request, Long memberId) {
        Member member = memberRepository.findById(memberId)
                .orElseThrow(() -> new NotFoundException("해당 회원을 찾을 수 없습니다."));

        Post post = request.toEntity(member);
        postRepository.save(post);

        return PostResponse.fromEntity(post);
    }

    /** ✅ 특정 게시글 조회 */
    @Transactional(readOnly = true)
    public PostResponse getPost(Long postId) {
        Post post = postRepository.findById(postId)
                .orElseThrow(() -> new NotFoundException("해당 게시글을 찾을 수 없습니다."));

        return PostResponse.fromEntity(post);
    }

    /** ✅ 모든 게시글 조회 */
    @Transactional(readOnly = true)
    public List<PostResponse> getAllPosts() {
        List<Post> posts = postRepository.findAll();
        return posts.stream()
                .map(PostResponse::fromEntity)
                .collect(Collectors.toList());
    }

    /** ✅ 게시글 수정 */
    public PostResponse updatePost(Long postId, UpdatePostRequest request) {
        Post post = postRepository.findById(postId)
                .orElseThrow(() -> new NotFoundException("해당 게시글을 찾을 수 없습니다."));

        request.updateEntity(post);
        postRepository.save(post);

        return PostResponse.fromEntity(post);
    }

    /** ✅ 게시글 상태 변경 (숨김/공개 등) */
    public PostResponse updatePostStatus(Long postId, UpdatePostStatusRequest request) {
        Post post = postRepository.findById(postId)
                .orElseThrow(() -> new NotFoundException("해당 게시글을 찾을 수 없습니다."));

        request.updateEntity(post);
        postRepository.save(post);

        return PostResponse.fromEntity(post);
    }

    /** ✅ 게시글 삭제 (소프트 삭제) */
    public void deletePost(Long postId) {
        Post post = postRepository.findById(postId)
                .orElseThrow(() -> new NotFoundException("해당 게시글을 찾을 수 없습니다."));

        post.setDeletedAt(java.time.LocalDateTime.now());
        postRepository.save(post);
    }
}