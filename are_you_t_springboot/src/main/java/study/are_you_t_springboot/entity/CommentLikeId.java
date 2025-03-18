package study.are_you_t_springboot.entity;

import java.io.Serializable;
import java.util.Objects;

public class CommentLikeId implements Serializable {

    private Long comment;
    private Long member;

    public CommentLikeId() {}

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CommentLikeId that = (CommentLikeId) o;
        return Objects.equals(comment, that.comment) &&
                Objects.equals(member, that.member);
    }

    @Override
    public int hashCode() {
        return Objects.hash(comment, member);
    }
}