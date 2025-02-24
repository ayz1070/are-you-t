package study.are_you_t_springboot.controller;

import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import study.are_you_t_springboot.dto.SignUpRequest;
import study.are_you_t_springboot.dto.MemberResponse;
import study.are_you_t_springboot.service.MemberService;

@RestController
@RequestMapping("/api/members")
public class MemberController {

    private final MemberService memberService;

    public MemberController(MemberService memberService) {
        this.memberService = memberService;
    }


    /// 소셜 로그인 회원가입
    @PostMapping("/signup/social")
    public ResponseEntity<MemberResponse> signUpWithSocial(@RequestBody @Valid SignUpRequest requestDto) {
        MemberResponse MemberResponse = memberService.signUpWithSocial(requestDto);
        return ResponseEntity.ok(MemberResponse);
    }

    /// 이메일 회원가입
    @PostMapping("/signup/email")
    public ResponseEntity<MemberResponse> signUpWithEmail(@RequestBody @Valid SignUpRequest requestDto) {
        MemberResponse MemberResponse = memberService.signUpWithEmail(requestDto);
        return ResponseEntity.ok(MemberResponse);
    }
}