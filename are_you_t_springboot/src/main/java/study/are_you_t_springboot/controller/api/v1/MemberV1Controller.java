package study.are_you_t_springboot.controller.api.v1;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import study.are_you_t_springboot.dto.member.MemberResponse;
import study.are_you_t_springboot.dto.member.SocialSignUpRequest;
import study.are_you_t_springboot.service.MemberService;

@RestController
@RequestMapping("/api/v1/members")
@RequiredArgsConstructor
public class MemberV1Controller {

    private final MemberService memberService;

    /** ✅ 소셜 회원가입 */
    @PostMapping("/signup/social")
    public ResponseEntity<MemberResponse> signUpWithSocial(@RequestBody SocialSignUpRequest request) {
        MemberResponse response = memberService.signUpWithSocial(request);
        return ResponseEntity.ok(response);
    }

    /** ✅ 내 정보 조회 */
    @GetMapping("/{memberId}")
    public ResponseEntity<MemberResponse> getMemberInfo(@PathVariable Long memberId) {
        MemberResponse response = memberService.getMemberById(memberId);
        return ResponseEntity.ok(response);
    }

    /** ✅ 회원 삭제 (관리자 기능) */
    @DeleteMapping("/{memberId}")
    public ResponseEntity<String> deleteMember(@PathVariable Long memberId) {
        memberService.deleteMember(memberId);
        return ResponseEntity.ok("회원이 삭제되었습니다.");
    }
}
