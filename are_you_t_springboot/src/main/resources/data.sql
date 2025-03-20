INSERT INTO are_you_t.members (id, created_at, deleted_at, email, mbti, nickname, password, profile_image_url, provider, `role`, social_id, status, updated_at)
VALUES
    (1, NOW(), NULL, 'user1@example.com', 'INTJ', '유저1', 'password1', 'profile1.png', 'KAKAO', 'USER', 'KAKAO1', 'ACTIVE', NOW()),
    (2, NOW(), NULL, 'user2@example.com', 'ENTP', '유저2', 'password2', 'profile2.png', 'KAKAO', 'USER', 'KAKAO2', 'ACTIVE', NOW()),
    (3, NOW(), NULL, 'user3@example.com', 'INFJ', '유저3', 'password3', 'profile3.png', 'KAKAO', 'USER', 'KAKAO3', 'ACTIVE', NOW());

INSERT INTO are_you_t.posts (id, content, created_at, deleted_at, status, title, updated_at, member_id)
VALUES
    (1, '첫 번째 게시글입니다.', NOW(), NULL, 'VISIBLE', '첫 번째 게시글', NOW(), 1),
    (2, '두 번째 게시글입니다.', NOW(), NULL, 'VISIBLE', '두 번째 게시글', NOW(), 2),
    (3, '세 번째 게시글입니다.', NOW(), NULL, 'VISIBLE', '세 번째 게시글', NOW(), 3);

INSERT INTO are_you_t.post_images (id, created_at, image_url, status, updated_at, post_id)
VALUES
    (1, NOW(), 'image1.jpg', 'VISIBLE', NOW(), 1),
    (2, NOW(), 'image2.jpg', 'VISIBLE', NOW(), 2),
    (3, NOW(), 'image3.jpg', 'VISIBLE', NOW(), 3);

INSERT INTO are_you_t.post_likes (member_id, post_id, created_at)
VALUES
    (1, 1, NOW()),
    (2, 1, NOW()),
    (3, 2, NOW());

INSERT INTO are_you_t.comments (id, content, created_at, deleted_at, is_edited, like_count, status, updated_at, member_id, parent_comment_id, post_id, edited_at)
VALUES
    (1, '첫 번째 댓글입니다.', NOW(), NULL, 0, 2, 'VISIBLE', NOW(), 1, NULL, 1, NULL),
    (2, '두 번째 댓글입니다.', NOW(), NULL, 1, 5, 'VISIBLE', NOW(), 2, NULL, 1, NOW()),
    (3, '세 번째 댓글입니다.', NOW(), NULL, 0, 0, 'VISIBLE', NOW(), 3, 1, 1, NULL);

INSERT INTO are_you_t.comment_likes (comment_id, member_id, created_at)
VALUES
    (1, 2, NOW()),
    (2, 3, NOW()),
    (3, 1, NOW());

INSERT INTO are_you_t.admins (id, created_at, email, password, `role`)
VALUES
    (1, NOW(), 'admin1@example.com', 'password1', 'SUPER_ADMIN'),
    (2, NOW(), 'admin2@example.com', 'password2', 'SUPER_ADMIN'),
    (3, NOW(), 'admin3@example.com', 'password3', 'SUPER_ADMIN');
