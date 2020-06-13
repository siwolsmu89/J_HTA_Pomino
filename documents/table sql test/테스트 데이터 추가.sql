-- 복붙해서 쓸것
INSERTO INTO 
()
VALUES
()
;

INSERT INTO users
(user_no, user_id, user_password, user_name, user_birth, user_gender, user_tel, user_email)
VALUES
(user_no_seq.NEXTVAL, 'kimkim', 'zxcv1234', '김김', '1989:10:27', 'M', '010-1234-1234', 'kkim@gmail.com')
;

INSERT INTO users
(user_no, user_id, user_password, user_name, user_birth, user_gender, user_tel, user_email)
VALUES
(user_no_seq.NEXTVAL, 'parkpak', 'zxcv1234', '박박', '1989:10:31', 'F', '010-1234-1234', 'ppak@gmail.com')
;

INSERT INTO deliver_locations
(location_no, location_addr_first, location_addr_second, location_addr_detail, user_no)
VALUES
(location_no_seq.NEXTVAL, '서울시 종로구', '봉익동 율곡로', '어디어디 디아망빌당4층', 100)
;

INSERT INTO deliver_locations
(location_no, location_addr_first, location_addr_second, location_addr_detail, user_no)
VALUES
(location_no_seq.NEXTVAL, '서울시 종로구', '익선동 어디어디', '어디어디 디아망빌당4층', 100)
;

INSERT INTO deliver_locations
(location_no, location_addr_first, location_addr_second, location_addr_detail, user_no)
VALUES
(location_no_seq.NEXTVAL, '서울시 종로구', '봉익동 율곡로', '어디어디 디아망빌당3층', 104)
;