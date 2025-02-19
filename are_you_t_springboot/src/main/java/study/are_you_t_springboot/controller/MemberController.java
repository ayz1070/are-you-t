package study.are_you_t_springboot.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import study.are_you_t_springboot.entity.Member;
import study.are_you_t_springboot.service.MemberService;

@RestController
@RequestMapping("/api/members")
@RequiredArgsConstructor
public class MemberController {

    private final MemberService memberService;

    @GetMapping("/{email}")
    public ResponseEntity<Member> getMember(@PathVariable String email) {
        return ResponseEntity.ok(memberService.findMemberByEmail(email));
    }
}