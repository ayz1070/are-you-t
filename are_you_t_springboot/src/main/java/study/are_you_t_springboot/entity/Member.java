package study.are_you_t_springboot.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import study.are_you_t_springboot.entity.type.MbtiType;
import study.are_you_t_springboot.entity.type.Provider;
import study.are_you_t_springboot.entity.type.Role;
import study.are_you_t_springboot.entity.type.Status;

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
    @GeneratedValue(strategy = GenerationType.UUID)  // UUID 자동 생성
    private UUID id;  // Long → UUID 로 변경

    @Column(unique = true)
    private String socialId;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Provider provider;

    @Column(unique = true)
    private String email;

    private String password;

    @Column(nullable = false)
    private String nickname;

    @Column()
    private String profileImageUrl;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private MbtiType mbti;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Role role = Role.USER;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Status status = Status.ACTIVE;

    @CreationTimestamp
    private LocalDateTime createdAt;

    @UpdateTimestamp
    private LocalDateTime updatedAt;

    private LocalDateTime deletedAt;
}