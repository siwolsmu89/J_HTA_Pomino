INSERT INTO branches
(branch_no, branch_name, branch_addr_first, branch_addr_second, branch_addr_detail, branch_tel, branch_image_src)
VALUES
(branch_no_seq.NEXTVAL, '종로 4가점', '서울특별시 종로구', '봉익동 율곡로', '디아망빌딩4층', '02-123-1234', '/domino/resource/images/branches/branch01.png');

INSERT INTO users
(user_no, user_id, user_password, user_name, user_birth, user_gender, user_tel, user_email)
VALUES
(user_no_seq.NEXTVAL, 'branch-100', 'zxcv1234', '김김이', SYSDATE, 'M', '02-123-1234', 'j4manager@domino.com');

INSERT INTO branches
(branch_no, branch_name, branch_addr_first, branch_addr_second, branch_addr_detail, branch_tel, branch_image_src)
VALUES
(branch_no_seq.NEXTVAL, '종암점', '서울특별시 성북구', '종암동 참살이로', '북바위빌딩 101호', '02-321-3434', '/domino/resource/images/branches/branch02.png');

INSERT INTO users
(user_no, user_id, user_password, user_name, user_birth, user_gender, user_tel, user_email)
VALUES
(user_no_seq.NEXTVAL, 'branch-101', 'zxcv1234', '홍홍이', SYSDATE, 'F', '02-321-3434', 'drmanager@domino.com');

INSERT INTO branches
(branch_no, branch_name, branch_addr_first, branch_addr_second, branch_addr_detail, branch_tel, branch_image_src)
VALUES
(branch_no_seq.NEXTVAL, '해운대점', '부산광역시 해운대구', '좌동 달맞이로', '미포 회센타 1층', '02-223-2234', '/domino/resource/images/branches/branch03.png');

INSERT INTO users
(user_no, user_id, user_password, user_name, user_birth, user_gender, user_tel, user_email)
VALUES
(user_no_seq.NEXTVAL, 'branch-102', 'zxcv1234', '이이김', SYSDATE, 'M', '02-223-2234', 'hudmanager@domino.com');

INSERT INTO branches
(branch_no, branch_name, branch_addr_first, branch_addr_second, branch_addr_detail, branch_tel, branch_image_src)
VALUES
(branch_no_seq.NEXTVAL, '명동점', '서울특별시 중구', '남산동 퇴계로', '명동거리 11-1', '02-313-1234', '/domino/resource/images/branches/branch04.png');

INSERT INTO users
(user_no, user_id, user_password, user_name, user_birth, user_gender, user_tel, user_email)
VALUES
(user_no_seq.NEXTVAL, 'branch-103', 'zxcv1234', '황황', SYSDATE, 'F', '02-313-1234', 'mdmanager@domino.com');

