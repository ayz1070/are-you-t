package study.are_you_t_springboot.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import study.are_you_t_springboot.entity.type.MbtiType;
import study.are_you_t_springboot.entity.type.Provider;
import study.are_you_t_springboot.entity.type.Role;
import study.are_you_t_springboot.entity.type.MemberStatus;

import java.time.LocalDateTime;

@Entity
@Table(name = "members")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Member {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)  // AutoIncrement 적용
    private Long id;  // UUID → Long 타입으로 변경

    @Column(unique = true, nullable = true)
    private String socialId;  // 소셜 로그인 식별자 (소셜 사용자만)

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Provider provider;  // 소셜 로그인 제공자 (KAKAO, GOOGLE, APPLE, EMAIL)

    @Column(unique = true, nullable = true)
    private String email;  // 일반 로그인 시 필수 (소셜 로그인 사용자는 null)

    private String password;  // 일반 로그인 시 필수 (해싱 필요)

    @Column(nullable = false, unique = true, length = 20)
    private String nickname;  // 닉네임 (유니크 설정)

    @Column(nullable = false)
    private String profileImageUrl;  // 기본 프로필 이미지 제공

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private MbtiType mbti;  // MBTI 정보

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Role role = Role.USER;  // 기본 역할

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private MemberStatus status = MemberStatus.ACTIVE;  // 계정 상태

    @CreationTimestamp
    private LocalDateTime createdAt;

    @UpdateTimestamp
    private LocalDateTime updatedAt;

    private LocalDateTime deletedAt;  // 탈퇴 시 설정됨
}
