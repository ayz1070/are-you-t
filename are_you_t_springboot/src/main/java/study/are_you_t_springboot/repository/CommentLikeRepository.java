package study.are_you_t_springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import study.are_you_t_springboot.entity.Comment;
import study.are_you_t_springboot.entity.CommentLike;
import study.are_you_t_springboot.entity.Member;

import java.util.Optional;

@Repository
public interface CommentLikeRepository extends JpaRepository<CommentLike, Long> {
    Optional<CommentLike> findByCommentAndMember(Comment comment, Member member);
}