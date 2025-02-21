package study.are_you_t_springboot.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import study.are_you_t_springboot.entity.type.AdminAction;
import study.are_you_t_springboot.entity.type.TargetType;

import java.time.LocalDateTime;

@Entity
@Table(name = "admin_logs")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AdminLog {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "admin_id", nullable = false)
    private Admin admin;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private AdminAction action;

    @Column(nullable = false)
    private Long targetId;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private TargetType targetType;

    @CreationTimestamp
    private LocalDateTime createdAt;
}