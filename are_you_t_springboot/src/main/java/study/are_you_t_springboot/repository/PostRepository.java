package study.are_you_t_springboot.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import study.are_you_t_springboot.entity.Post;


public interface PostRepository extends JpaRepository<Post, Long> {
    // 최신순으로 게시글을 조회하는 메서드 (페이징 적용)
    Page<Post> findAllByOrderByCreatedAtDesc(Pageable pageable);
}