package study.are_you_t_springboot.dto.post;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import study.are_you_t_springboot.entity.Member;
import study.are_you_t_springboot.entity.Post;
import study.are_you_t_springboot.entity.type.PostStatus;

@Getter
@Setter
public class CreatePostRequest {

    @NotBlank(message = "제목은 필수 입력값입니다.")
    @Size(max = 255, message = "제목은 255자 이하로 입력해주세요.")
    private String title;

    @NotBlank(message = "내용은 필수 입력값입니다.")
    private String content;

    /** ✅ Request → Entity 변환 */
    public Post toEntity(Member member) {
        return Post.builder()
                .member(member)
                .title(title)
                .content(content)
                .status(null) // @PrePersist에서 기본값 설정됨
                .build();
    }
}