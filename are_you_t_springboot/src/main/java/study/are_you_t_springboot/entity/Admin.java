package study.are_you_t_springboot.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import study.are_you_t_springboot.entity.type.AdminRole;

import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "admins")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Admin {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(unique = true, nullable = false)
    private String email;

    @Column(nullable = false)
    private String password;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private AdminRole role = AdminRole.ADMIN;

    @CreationTimestamp
    private LocalDateTime createdAt;
}