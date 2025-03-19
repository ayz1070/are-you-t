package study.are_you_t_springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import study.are_you_t_springboot.entity.Post;

public interface PostRepository extends JpaRepository<Post, Long> {
}