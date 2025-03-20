package study.are_you_t_springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import study.are_you_t_springboot.entity.Member;
import study.are_you_t_springboot.entity.Post;
import study.are_you_t_springboot.entity.PostLike;

import java.util.Optional;

public interface PostLikeRepository extends JpaRepository<PostLike, Long> {
    Optional<PostLike> findByPostAndMember(Post post, Member member);
}