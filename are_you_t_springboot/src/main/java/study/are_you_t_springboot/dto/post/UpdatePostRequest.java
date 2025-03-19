package study.are_you_t_springboot.dto.post;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import study.are_you_t_springboot.entity.Post;

@Getter
@Setter
public class UpdatePostRequest {

    @NotBlank(message = "제목은 필수 입력값입니다.")
    @Size(max = 255, message = "제목은 255자 이하로 입력해주세요.")
    private String title;

    @NotBlank(message = "내용은 필수 입력값입니다.")
    private String content;

    /** ✅ Request 데이터를 기존 Entity에 반영 */
    public void updateEntity(Post post) {
        post.setTitle(title);
        post.setContent(content);
    }
}