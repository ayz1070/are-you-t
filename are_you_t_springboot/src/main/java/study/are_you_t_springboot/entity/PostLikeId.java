package study.are_you_t_springboot.entity;

import java.io.Serializable;
import java.util.Objects;

public class PostLikeId implements Serializable {

    private Long post;
    private Long member;

    public PostLikeId() {}

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        PostLikeId that = (PostLikeId) o;
        return Objects.equals(post, that.post) && Objects.equals(member, that.member);
    }

    @Override
    public int hashCode() {
        return Objects.hash(post, member);
    }
}