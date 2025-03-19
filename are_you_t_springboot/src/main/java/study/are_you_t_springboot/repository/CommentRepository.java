package study.are_you_t_springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import study.are_you_t_springboot.entity.Comment;
import study.are_you_t_springboot.entity.Member;
import study.are_you_t_springboot.entity.Post;

import java.util.List;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Long> {

    // 특정 게시글(postId)에 대한 모든 댓글 조회
    List<Comment> findByPostOrderByCreatedAtAsc(Post post);


    List<Comment> findByMemberOrderByCreatedAtAsc(Member member);

}