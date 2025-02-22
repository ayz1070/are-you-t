package study.are_you_t_springboot.entity;

import java.io.Serializable;

import java.util.Objects;

public class CommentLikeId implements Serializable {

    private Long comment;  // Comment 엔티티의 @Id 필드와 이름, 타입 동일해야 함
    private Long member;   // Member 엔티티의 @Id 필드와 이름, 타입 동일해야 함

    // 기본 생성자 (No-Args Constructor)
    public CommentLikeId() {}

    // 매개변수가 있는 생성자 (선택 사항)
    public CommentLikeId(Long comment, Long member) {
        this.comment = comment;
        this.member = member;
    }

    // equals() 오버라이딩
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CommentLikeId that = (CommentLikeId) o;
        return Objects.equals(comment, that.comment) &&
                Objects.equals(member, that.member);
    }

    // hashCode() 오버라이딩
    @Override
    public int hashCode() {
        return Objects.hash(comment, member);
    }
}