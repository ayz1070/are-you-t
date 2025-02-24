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
import java.util.UUID;

@Entity
@Table(name = "members")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Member {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(unique = true)
    private String socialId;  // 소셜 로그인 식별자

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Provider provider = Provider.EMAIL;  // 기본값 EMAIL

    @Column(unique = true)
    private String email;  // 일반 로그인 시 이메일

    private String password;  // 일반 로그인 시 비밀번호

    @Column(nullable = false)
    private String nickname;

    @Column
    private String profileImageUrl;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private MbtiType mbti;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Role role = Role.USER;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private MemberStatus status = MemberStatus.ACTIVE;

    @CreationTimestamp
    private LocalDateTime createdAt;

    @UpdateTimestamp
    private LocalDateTime updatedAt;

    private LocalDateTime deletedAt;
}